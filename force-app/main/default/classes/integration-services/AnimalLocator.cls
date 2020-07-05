global class AnimalLocator 
{
    public static String getAnimalNameById(Integer id) 
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String animal_name = '';
        if (response.getStatusCode() == 200) 
        {
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String,Object>) result.get('animal');
            animal_name = String.valueOf(animal.get('name') != null ? animal.get('name') : '');
        }
        return animal_name;
    }
}
