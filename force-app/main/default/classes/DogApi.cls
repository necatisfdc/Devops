public class DogApi {

   /* @auraEnabled(cacheable = true)
    public static String getAllBreedList(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint('https://dog.ceo/api/breeds/list/all');
    HttpResponse response = http.send(request);
     return response.getBody();       
}

    @auraEnabled(cacheable = true)
    public static String getAllSubBreed(String breed){
    System.debug('selected breed: ' + breed);
    String url = 'https://dog.ceo/api/breed/' + breed + '/list';
    
        Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint(url);
    HttpResponse response = http.send(request);
         System.debug('subBreeds: ' + response.getBody() );
      return response.getBody();       
    }
    
     @auraEnabled(cacheable = true)
    public static String getAllBreedImages(String breed){
    String url = 'https://dog.ceo/api/breed/' + breed + '/images';
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint(url);
    HttpResponse response = http.send(request);
     return response.getBody();       
}
// OLD METHODS BELOW//

	@auraEnabled(cacheable = true)
    public static String myName(){
		return 'Aysen';
	}


	@auraEnabled(cacheable = true)
    public static String getDogs(){
        String url = 'https://dog.ceo/api/breeds/list/all';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response.getBody();

    }

    public static void getDogData(){
        String url = 'https://dog.ceo/api/breeds/list/all';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        ResponseWrapper data = (ResponseWrapper) System.JSON.deserialize(response.getBody(), ResponseWrapper.class);
      
        System.debug(data.message.australian);

    }

	public static void getSubBreed(String breed){
		String url = 'https://dog.ceo/api/breed/' + breed + '/list';
 		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
		System.debug(response.getBody());
	}

	public static void getImagesByBreed(String breed){
		String url = 'https://dog.ceo/api/breed/' + breed + '/images';
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
		System.debug(response.getBody());
	}

	public static void addFav(String breedType, String imageLink){
		FavDog__c favDog = new FavDog__c();
		favDog.BreedType__c = breedType;
		favDog.ImageLink__c = imageLink;
		insert favDog;
	}

	public static void removeFav(String idOfDog){
		FavDog__c dogToRemove = new FavDog__c();
		dogToRemove.id = idOfDog;
		delete dogToRemove;
	}
	//my change

	public static void listOfFavDogs(){
		List<FavDog__c> favDogList = [SELECT id, BreedType__c, ImageLink__c
										FROM FavDog__c];
		System.debug(favDogList);								
	} 

    public class ResponseWrapper{
       	public Message message;
	    public String status; 
    }

    public class Message {
		public List<Affenpinscher> affenpinscher;
		public List<Affenpinscher> african;
		public List<Affenpinscher> airedale;
		public List<Affenpinscher> akita;
		public List<Affenpinscher> appenzeller;
		public List<String> australian;
		public List<Affenpinscher> basenji;
		public List<Affenpinscher> beagle;
		public List<Affenpinscher> bluetick;
		public List<Affenpinscher> borzoi;
		public List<Affenpinscher> bouvier;
		public List<Affenpinscher> boxer;
		public List<Affenpinscher> brabancon;
		public List<Affenpinscher> briard;
		public List<String> buhund;
		public List<String> bulldog;
		public List<String> bullterrier;
		public List<String> cattledog;
		public List<Affenpinscher> chihuahua;
		public List<Affenpinscher> chow;
		public List<Affenpinscher> clumber;
		public List<Affenpinscher> cockapoo;
		public List<String> collie;
		public List<Affenpinscher> coonhound;
		public List<String> corgi;
		public List<Affenpinscher> cotondetulear;
		public List<Affenpinscher> dachshund;
		public List<Affenpinscher> dalmatian;
		public List<String> dane;
		public List<String> deerhound;
		public List<Affenpinscher> dhole;
		public List<Affenpinscher> dingo;
		public List<Affenpinscher> doberman;
		public List<String> elkhound;
		public List<Affenpinscher> entlebucher;
		public List<Affenpinscher> eskimo;
		public List<String> finnish;
		public List<String> frise;
		public List<Affenpinscher> germanshepherd;
		public List<String> greyhound;
		public List<Affenpinscher> groenendael;
		public List<Affenpinscher> havanese;
		public List<String> hound;
		public List<Affenpinscher> husky;
		public List<Affenpinscher> keeshond;
		public List<Affenpinscher> kelpie;
		public List<Affenpinscher> komondor;
		public List<Affenpinscher> kuvasz;
		public List<Affenpinscher> labradoodle;
		public List<Affenpinscher> labrador;
		public List<Affenpinscher> leonberg;
		public List<Affenpinscher> lhasa;
		public List<Affenpinscher> malamute;
		public List<Affenpinscher> malinois;
		public List<Affenpinscher> maltese;
		public List<String> mastiff;
		public List<Affenpinscher> mexicanhairless;
		public List<Affenpinscher> mix;
		public List<String> mountain;
		public List<Affenpinscher> newfoundland;
		public List<Affenpinscher> otterhound;
		public List<String> ovcharka;
		public List<Affenpinscher> papillon;
		public List<Affenpinscher> pekinese;
		public List<Affenpinscher> pembroke;
		public List<String> pinscher;
		public List<Affenpinscher> pitbull;
		public List<String> pointer;
		public List<Affenpinscher> pomeranian;
		public List<String> poodle;
		public List<Affenpinscher> pug;
		public List<Affenpinscher> puggle;
		public List<Affenpinscher> pyrenees;
		public List<Affenpinscher> redbone;
		public List<String> retriever;
		public List<String> ridgeback;
		public List<Affenpinscher> rottweiler;
		public List<Affenpinscher> saluki;
		public List<Affenpinscher> samoyed;
		public List<Affenpinscher> schipperke;
		public List<String> schnauzer;
		public List<String> setter;
		public List<Affenpinscher> sharpei;
		public List<String> sheepdog;
		public List<Affenpinscher> shiba;
		public List<Affenpinscher> shihtzu;
		public List<String> spaniel;
		public List<String> springer;
		public List<Affenpinscher> stbernard;
		public List<String> terrier;
		public List<Affenpinscher> tervuren;
		public List<Affenpinscher> vizsla;
		public List<String> waterdog;
		public List<Affenpinscher> weimaraner;
		public List<Affenpinscher> whippet;
		public List<String> wolfhound;
	}

	public class Affenpinscher {
	}*/

	//I need to learn something
	// I have second comment
}