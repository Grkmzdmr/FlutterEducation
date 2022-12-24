Görev 1 : 
Color Manager'a yeni renkler ekleyerek, onboarding ekranının tasarımının geliştirilmesi. (Responsive-Spacer(),Expanded()) 


Görev 2 : 
State Renderer Tiplerinin tasarlanması. (FULL_SCREEN_LOADINGS vs.) 


Görev 3 :
Dependecy Injection tekrar edilecek, StreamController tekrar, Dio kütüphanesi ön çalışma , Retrofit kütüphanesi ön çalışma


Görev 4 : 
Derste yazılan kodların tekrarı (Freezed Package,Dartz Package) ViewModel Input Output mantığı


Not : View -> ViewModel -> UseCase -> Repository -> RepositoryImplementer -> RemoteDataSource -> RemoteDataSourceImplementer -> AppServiceClient 

(View => Sadece Tasarım Kodları) (ViewModel => O View için gerekli olan fonksiyonların, verilerin elde edildiği yer vb.) (UseCase => ViewModelda çağırdığımız fonksiyonlar)

(Repository -> Uygulama Katmanın fonksiyonların isimleri var) (RepositoryImplementer -> Uygulama Katmanı fonksiyonların içinin doldurulmuş hali) 

(RemoteDataSource -> Api ile haberleşmiş fonksiyonların isimleri var) (RemoteDataSourceImplementer -> Api ile haberleşmiş fonksiyonların içinin doldurulmuş hali )

(AppSeriveClient -> Api ile bağlanan nokta fiziksel nokta gibi diyebiliriz)


(Mapper -> Apiden gelen nesnelerin özellikleriyle oynadığımız yer örnek olarak null geliyorsa 0 yap diyoruz,gelen veri üzerinde manipülasyon aşaması)


Görev 5 : LoginView'ı güzelleştir, Hata PopUp'ını güzelleştir , Register View, ViewModel yarat logine benzer şekilde api ile haberleştir ve açıkta bulunan stringleri Resources altında AppString class'ında topla

