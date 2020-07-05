public class ParkLocator 
{
    public static String[] country(String countryName) 
    {
        ParkService.ParksImplPort park_service = new ParkService.ParksImplPort();
        return park_service.byCountry(countryName);
    }
}
