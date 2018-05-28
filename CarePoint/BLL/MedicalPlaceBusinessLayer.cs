using DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MedicalPlaceBusinessLayer
    {
        private CarePointEntities DBEntities { get; set; }
        public MedicalPlaceBusinessLayer()
        {
            DBEntities = new CarePointEntities();
        }
        public MedicalPlace GetMedicalPlace(long id)
        {
            return DBEntities.MedicalPlaces.SingleOrDefault(place => place.ID == id);
        }
        public void AddMedicalPlace(MedicalPlace medicalPlace)
        {
            DBEntities.MedicalPlaces.Add(medicalPlace);
            DBEntities.SaveChanges();
        }
        public ICollection<MedicalPlaceType> GetAllTypes()
        {
            return DBEntities.MedicalPlaceTypes.ToList();
        }
        public ICollection<MedicalPlace> SearchCareUnitsPlace(double latitude, double longitude, string serviceType, string placeType, bool distance, bool cost, bool rate, bool popularity)
        {
            List<CareUnit> careUnits = new List<CareUnit>();
            List<CareUnit> sortedDistance = new List<CareUnit>();// ascending
            List<CareUnit> sortedPopularity = new List<CareUnit>();// descending
            List<CareUnit> sortedCost = new List<CareUnit>();// ascending
            List<CareUnit> sortedRate = new List<CareUnit>();//descending
            Dictionary<MedicalPlace, int> result = new Dictionary<MedicalPlace, int>();
            careUnits = DBEntities.CareUnits.Where(careUnit => careUnit.Name == serviceType || careUnit.ProviderID == (DBEntities.MedicalPlaces.SingleOrDefault(medicalPlace => medicalPlace.Name == placeType)).ID).ToList();
            if (distance)
            {
                string point = string.Format("POINT({0} {1})", longitude, latitude);
                sortedDistance = careUnits.OrderBy(careUnit => (DBEntities.MedicalPlaces.SingleOrDefault(place => place.ID == careUnit.ProviderID)).Location.Distance(DbGeography.FromText(point, 4326))).ToList();
            }
            if (rate)
            {
                sortedRate = careUnits.OrderByDescending(careUnit => careUnit.CareUnitRatings.Average(care => care.Rating)).ToList();
            }
            if (cost)
            {
                sortedCost = careUnits.OrderBy(careUnit => careUnit.Cost).ToList();
            }
            int Rate = 0, Cost = 0, Distance = 0, Popularity = 0;
            foreach (CareUnit careUnit in careUnits)
            {
                Distance = sortedDistance.IndexOf(careUnit) + 1;
                Rate = sortedRate.IndexOf(careUnit) + 1;
                Popularity = sortedPopularity.IndexOf(careUnit) + 1;
                Cost = sortedCost.IndexOf(careUnit) + 1;
                result.Add((DBEntities.MedicalPlaces.SingleOrDefault(medical => medical.ID == careUnit.ID)), (int)((1 / Distance * 1.0) + 2 * Cost + 2 * Rate + Popularity));
            }
            return result.OrderByDescending(res => res.Value).Select(res => res.Key).ToList();
        }
        public ICollection<MedicalPlace> SearchMedicalPlace(double latitude, double longitude, string serviceName, string placeName, bool isDistance, bool isCost, bool isRate, bool isPopularity)
        {
            List<MedicalPlace> medicalPlaces = new List<MedicalPlace>();
            List<MedicalPlace> sortedDistance = new List<MedicalPlace>();// ascending
            List<MedicalPlace> sortedPopularity = new List<MedicalPlace>();// descending
            List<MedicalPlace> sortedCost = new List<MedicalPlace>();// ascending
            List<MedicalPlace> sortedRate = new List<MedicalPlace>();//descending
            Dictionary<int, MedicalPlace> result = new Dictionary<int, MedicalPlace>();
            if(placeName!="" && serviceName == "")
            {
                medicalPlaces = DBEntities.MedicalPlaces.Where(m => m.Name.Contains(placeName) /*&& m.IsConfirmed == true*/).ToList();
            }
            else if(placeName=="" && serviceName != "")
            {
                medicalPlaces = DBEntities.Services.Where(s => s.Name.Contains(serviceName)).Select(s => s.MedicalPlace).ToList();
            }
            else if(placeName !="" && serviceName != "")
            {
                medicalPlaces = DBEntities.Services.Where(s => s.Name.Contains(serviceName) || s.MedicalPlace.Name.Contains(placeName)).Select(m=>m.MedicalPlace).ToList();
            }
            if (isDistance)
            {
                string point = string.Format("POINT({0} {1})", longitude, latitude);
                sortedDistance = medicalPlaces.OrderBy(m => m.Location.Distance(DbGeography.FromText(point, 4326))).ToList();
            }
            if (isRate)
            {
                sortedRate = medicalPlaces.OrderByDescending(m => m.Services.Average(s => s.ServiceRatings.Sum(x => x.Rating))).ToList();
            }
            if (isCost)
            {
                if (serviceName != "")
                {
                    sortedCost = medicalPlaces.OrderBy(m => m.Services.Where(s => s.Name.Contains(serviceName)).Select(c => c.Cost)).ToList();
                }
                else
                {
                    sortedCost = medicalPlaces.OrderBy(m => m.Services.Average(c => c.Cost)).ToList();
                }
            }
            if (isPopularity)
            {
                sortedPopularity = SortMedicalPlacesOnPopularity(medicalPlaces);
            }
            int Rate = 0, Cost = 0, Distance = 0, Popularity = 0;
            foreach (MedicalPlace medicalPlace in medicalPlaces)
            {
                Distance = sortedDistance.IndexOf(medicalPlace) + 1;
                Rate = sortedRate.IndexOf(medicalPlace) + 1;
                Popularity = sortedPopularity.IndexOf(medicalPlace) + 1;
                Cost = sortedCost.IndexOf(medicalPlace) + 1;
                result.Add((int)((1 / Distance * 1.0) + 2 * Cost + 2 * Rate + Popularity), medicalPlace);
            }
            return result.OrderByDescending(res => res.Key).Select(res => res.Value).ToList();
        }

        private List<MedicalPlace> SortMedicalPlacesOnPopularity(List<MedicalPlace> medicalPlaces)
        {
            Dictionary<MedicalPlace, long> result = new Dictionary<MedicalPlace, long>();
            foreach (MedicalPlace m in medicalPlaces)
            {
                long count=DBEntities.HistoryRecords.Where(h => h.MedicalPlace.ID == m.ID).Count();
                result.Add(m, count);
            }
            return result.OrderByDescending(res => res.Value).Select(res => res.Key).ToList();
        }

        public ICollection<MedicalPlace> GetSortedMedicalPlaces(string location)
        {
            ICollection<MedicalPlace> medicalPlaces = new List<MedicalPlace>();
            medicalPlaces = medicalPlaces.OrderBy(medicalPlace => medicalPlace.Location.Distance(DbGeography.FromText(location, 4326))).ToList();
            return medicalPlaces;
        }

        public ICollection<Specialist> GetContributersOfAmbulanceService(string location, int numberOfPlaces)
        {
            List<MedicalPlace> medicalPlaces = GetSortedMedicalPlaces(location).ToList();
            ICollection<Service> services = new List<Service>();
            List<Specialist> providers = new List<Specialist>();
            services = medicalPlaces.Select(s => s.Services.SingleOrDefault(service=>service.ServiceCategory.Name.Equals("Ambulance"))).ToList();
            int min = Math.Min(services.ToArray().Length, numberOfPlaces);
            services = services.Take(min).ToList();
            foreach (Service service in services)
            {
                providers.Union(service.ServiceMembershipRequests.
                        Where(request => request.IsConfirmed == true).Select(s=>s.Specialist));
            }
            return providers;
        }

    }
}
