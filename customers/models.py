import uuid
from django.db import models
from django.db.models.fields import Field
from django.urls.base import reverse


class Nationality(models.Model):
    code_nationality=models.CharField(max_length=3,primary_key=True, verbose_name="Code Pays")
    nationality = models.CharField(max_length=50, verbose_name="Nationalité", null=False, unique=True)

    def __str__(self):
        """return the name of Nationalité"""
        return self.nationality

class Country(models.Model):
    code_country=models.CharField(max_length=3, primary_key=True, verbose_name="Code Nationalité")
    country = models.CharField(max_length=50, verbose_name="Pays", null=False, unique=True)

    def __str__(self):
        """return the name of Pays"""
        return self.country

class City(models.Model):
    city = models.CharField(max_length=50, verbose_name="Ville", null=False, unique=True)

    def __str__(self):
        """return the name of Pays"""
        return self.city  

class LegalForm(models.Model):
    code_lf=models.IntegerField(primary_key=True, verbose_name="Code FJ")
    lf_name = models.CharField(verbose_name="Sigle", max_length=20, null=False, unique=True)
    full_lf_name = models.CharField(verbose_name="Forme Juridique", max_length = 300, null=False)
    
    def __str__(self):
        """return the name of forme Juridique"""
        return self.lf_name
  
class Currency(models.Model):
    currency_code = models.CharField(max_length=3,null=False, unique=True, verbose_name="Code Devise", primary_key=True)
    currency = models.CharField(max_length=50, null=False, unique=True, verbose_name="Devise et Pays",)
    
    def __str__(self):
        """return the name of forme Juridique"""
        return self.currency_code
 
class Company(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    name = models.CharField(max_length=100, verbose_name="Raison Sociale", null=False, unique=True)
    adresse = models.TextField(max_length=300, verbose_name="Adresse", null=True)
    code_postal = models.CharField(max_length=50, verbose_name="Code Postal", null=True)
    city = models.CharField(max_length=100, verbose_name="Ville", null=False)
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, verbose_name="Pays", null=True, default='212')
    nationality = models.ForeignKey(Nationality, on_delete=models.SET_NULL, null=True, verbose_name="Nationalité", blank=True, default='212')
    national_law = models.BooleanField(default=True, verbose_name="De Droit National ?")
    ice = models.CharField(max_length=15, verbose_name="ICE", null=True, blank=True)
    identifiant_fiscal = models.CharField(max_length=10, verbose_name="Identifiant Fiscal", null=True, blank=True)
    cnss = models.CharField(max_length=10, verbose_name="Num Affiliation CNSS", null=True, blank=True)
    rc = models.CharField(max_length=10, verbose_name="Num Registre de Commerce", null=True, blank=True)
    tp = models.CharField(max_length=10, verbose_name="Num Taxe Professionnelle", null=True, blank=True)
    activity = models.TextField(max_length=300, verbose_name="Activité", null=True)

    class Month(models.IntegerChoices):
        Janvier = (1,'Janvier')
        Février = (2,'Février')
        Mars = (3,'Mars')
        Avril =(4, 'Avril')
        Mai = (5, 'Mai')
        Juin = (6, 'Juin')
        Juillet = (7, 'Juillet')
        Août = (8, 'Août')
        Septembre = (9, 'Septembre')
        Octobre = (10, 'Octobre')
        Novembre = (11, 'Novembre')
        Décembre = (12, 'Décembre')
        
    fiscal_year = models.IntegerField(verbose_name="Mois d'Ouverture Année Fiscale", choices=Month.choices, null=False, default=1)
    create_date = models.DateField(verbose_name="Date de Création", null=True, blank=True)
    
    class Statut(models.IntegerChoices):
        En_Attente = 0, ('En Attente')
        Actif = 1, ('Actif')
        Suspendu = 2, ('Suspendu')
        InActif = 3, ('InActif')

    legal_form = models.ForeignKey(LegalForm, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Forme Juridique")
    share_capital = models.FloatField(verbose_name="Capital Social", blank=True)
    nominal_value = models.FloatField(verbose_name="Valeur Nominale", blank=True)
    currency = models.ForeignKey(Currency, on_delete=models.SET_NULL, null=True, verbose_name="Devise", default='MAD')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    terminate_date = models.DateField(verbose_name="Date de Cessation/Dissolution", null=True, blank=True)
    liquidation_date = models.DateField(verbose_name="Date de Liquidation", null=True, blank=True)
    file = models.ImageField(verbose_name="Joindre Logo", upload_to='files/customers/logo', null=True, blank=True) # new
    file_rc = models.FileField(verbose_name="Joindre Extrat RC", upload_to='files/customers/rc', null=True, blank=True) # new
    file_if = models.FileField(verbose_name="Joindre Bulletin IF", upload_to='files/customers/if', null=True, blank=True) # new
    
    def get_absolute_url(self):
        return reverse('customers:companyDetail', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name of company"""
        return self.name


class Office(models.Model):
    code_lf=models.IntegerField(primary_key=True, verbose_name="Code Cabinet")
    office = models.CharField(max_length=100, verbose_name="Cabinet", null=False, unique=True)
    company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True)
    ip = models.CharField(max_length=100, verbose_name="IP", null=False, blank=True)
    port = models.CharField(max_length=100, verbose_name="Port", null=False, blank=True)
    password = models.CharField(max_length=100, verbose_name="Pass", null=False, blank=True)

    def __str__(self):
        """return the name of the office"""
        return self.office


class BankAcount(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    bank_name=models.CharField(verbose_name="Banque", max_length=100, null=False)
    agency = models.CharField(verbose_name="Agence", max_length=100, null=False)
    rib =models.CharField(verbose_name="RIB", max_length=24, null=False, unique=True)
    bic =models.CharField(verbose_name="Code BIC/SWIFT",max_length=8, null=False, blank=True)
    iban =models.CharField(verbose_name="Code IBAN", max_length=2, null=False, blank=True)
    closed = models.BooleanField(verbose_name="Compte Clôturé ?", default=False)
    clos_date=models.DateTimeField(verbose_name="Date de clôture", null=True, blank=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, null=True)
    file = models.FileField(verbose_name="Joindre RIB", upload_to='files/customers/rib', null=True, blank=True) # new

    class Meta:
        unique_together = ['company', 'bank_name']
        
    def __str__(self):
        """return the name of bank"""
        return self.bank_name


class Person(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    last_name = models.CharField(max_length=100, verbose_name="Nom", null=False)
    first_name = models.CharField(max_length=100, verbose_name="Prénom", null=False)
    
    class Civility(models.IntegerChoices):
        Monsieur = (1, 'Monsieur')
        Madame = (2, 'Madame')
    
    civility = models.IntegerField(choices=Civility.choices, verbose_name="Civilité", null=False)
  
    class IdCard(models.IntegerChoices):
        CNI = 1, ('CNIE')
        Passeport = 2, ('Passeport')
        CS = 3, ('Carte Séjours')
        
    id_card = models.IntegerField(choices=IdCard.choices, verbose_name="Pièce d'Identité", null=True)
    id_numbre = models.CharField(max_length=20, verbose_name="Numéro Pièce d'Identité", null=True)
    nationality = models.ForeignKey(Nationality, on_delete=models.SET_NULL, null=True, verbose_name="Nationalité", default='212')
    birth_date = models.DateField(verbose_name="Date de naissance", null=True, blank=True)
    birth_place = models.CharField(max_length=50,verbose_name="Lieu de naissance", null=True, blank=True)
    adresse = models.CharField(max_length=300,verbose_name="Adresse", null=True)
    code_postal = models.CharField(max_length=50, verbose_name="Code Postal", null=True)
    city = models.CharField(max_length=100, verbose_name="Ville", null=False)
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, verbose_name="Pays", null=True, default='212')
    resident = models.BooleanField(default=True, verbose_name="Résident National ?")
    file = models.FileField(verbose_name="Joindre ID Card", upload_to='files/customers/id_card', null=True, blank=True) # new
    
    class Meta:
        unique_together = ['last_name', 'first_name']
        
    def get_absolute_url(self):
        return reverse('customers:personDetail', kwargs={'pk': str(self.pk)})

    def __str__(self):
        """return the name personne"""
        return str(self.last_name +' '+ self.first_name)

class Contact(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    fonction = models.CharField(max_length=100, verbose_name="Fonction", null=False)
    person=models.ForeignKey(Person, on_delete=models.SET_NULL, verbose_name="Nom du Contact", null=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="Raison Sociale", null=True, blank=True)
    email = models.EmailField(max_length=100, verbose_name="Email", null=False)
    phone = models.CharField(max_length=100, verbose_name="Téléphone", null=False)
    active = models.BooleanField(verbose_name="Actif ?" ,default=1)
    
    def get_absolute_url(self):
        return reverse('customers:contactDetail', kwargs={'pk': str(self.pk)})    
    class Meta:
        unique_together = ['company', 'person']
    def __str__(self):
        """return the name of contact"""
        return str(self.person) +' ('+ str(self.fonction) +' - '+ str(self.company) + ')'
class Shareholder(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="Raison Sociale", null=True)
    person = models.ForeignKey(Person, on_delete=models.SET_NULL, verbose_name="Nom de l'Actionnaire", null=True)
    action = models.IntegerField(verbose_name="Nombre d'Action", null=False)

    class Meta:
        unique_together = ['company', 'person']
    
    def __str__(self):
        """return the name of Shareholder"""
        return self.person.last_name +" "+ self.person.first_name + " ("+str(self.action)+" actions)"

class ShareholderLink(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    company = models.OneToOneField(Company, on_delete=models.SET_NULL, verbose_name="Raison Sociale", null=True)
    date_participation = models.DateTimeField(verbose_name="Date de participation", auto_now=True)
            
    def get_absolute_url(self):
        return reverse('customers:updateShareholderLink', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name of Shareholder"""
        return str(self.company)

class ShareholderCompany(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    shareholderlink = models.ForeignKey(ShareholderLink, on_delete=models.SET_NULL, verbose_name="Raison Sociale", null=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="Société Actionnaire", null=True)
    action = models.IntegerField(verbose_name="Nombre d'Action", null=False)
    
    class Meta:
        unique_together = ['company', 'shareholderlink']
                    
    def __str__(self):
        """return the name of Shareholder"""
        return str(self.company) + " ("+str(self.action)+" actions)"

   
class RoleRepresentative(models.Model):
    rolerepresentative = models.CharField(verbose_name="Rôle du Représentant", max_length=200, null=False, unique=True)

    def __str__(self):
        """return the name of Pays"""
        return str(self.rolerepresentative)
    
class Representative(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="Raison Sociale", null=True)
    person = models.ForeignKey(Person, on_delete=models.SET_NULL, verbose_name="Nom du Représentant", null=True)
    rolerepresentative = models.ForeignKey(RoleRepresentative,verbose_name="Rôle du Représentant", null=True, on_delete=models.SET_NULL)
    date_nomination = models.DateTimeField(verbose_name="Date de Nomination", auto_now=True)
    terminate_role = models.BooleanField(default=False, verbose_name="Fin de Mandat ?")
    
    class Meta:
        unique_together = ['company', 'person']
                
    def __str__(self):
        """return the name of Représentant"""
        return str(self.person) +' ('+ str(self.rolerepresentative) +')'


class RepresentativeLink(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    company = models.OneToOneField(Company, on_delete=models.SET_NULL, verbose_name="Raison Sociale", null=True)
    date_nomination = models.DateTimeField(verbose_name="Date", auto_now=True)

    def get_absolute_url(self):
        return reverse('customers:updateRepresentativeLink', kwargs={'pk': str(self.pk)})
                   
    def __str__(self):
        """return the name of Représentant PM"""
        return str(self.company)

class RepresentativeCompany(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    representativelink = models.ForeignKey(RepresentativeLink, on_delete=models.SET_NULL, verbose_name="Société Représentée", null=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, verbose_name="Raison Sociale", null=True)
    rolerepresentative = models.ForeignKey(RoleRepresentative,verbose_name="Rôle du Représentant", null=True, on_delete=models.SET_NULL)
    date_nomination = models.DateTimeField(verbose_name="Date de Nomination", auto_now=True)
    terminate_role = models.BooleanField(default=False, verbose_name="Fin de Mandat ?")
    
    class Meta:
        unique_together = ['company', 'representativelink']
                     
    def __str__(self):
        """return the name of Représentant PM"""
        return str(self.representativelink) +' ('+str(self.company)+')'

class Prospect(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    office = models.ForeignKey(Office, on_delete=models.SET_NULL, verbose_name= "Cabinet", null=True)
    contact = models.ForeignKey(Contact, on_delete=models.SET_NULL, verbose_name="Contact", null=True)
    date_contact = models.DateField(verbose_name="Date Prise Contact", auto_created = True)
    
    class Statut(models.IntegerChoices):
        Contact = 0, ('Prise de Contact')
        Rappel = 1, ('Rappel')
        Cotation = 2, ('Proposition/LDM')
        Client = 3, ('Client')    
        Echec = 4, ('Abandon')    
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    comment = models.TextField(verbose_name="Commentaire", null=True)

    def get_absolute_url(self):
        return reverse('customers:prospectDetail', kwargs={'pk': str(self.pk)})    
    
    class Meta:
        unique_together = ['contact', 'office']
                
    def __str__(self):
        """return the name of Prospect"""
        return str(self.contact)

class BlackList(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    office = models.ForeignKey(Office, on_delete=models.SET_NULL, verbose_name= "Cabinet", null=True)
    codedb = models.CharField(max_length=3,verbose_name="Code Base Donnée", null=True)

    class Meta:
        unique_together = ['codedb', 'office']
                
    def __str__(self):
        """return the name of Prospect"""
        return str(self.codedb) +"/" +str(self.office)

class CompanyTemps(models.Model):
    exclude = models.BooleanField(default=False, verbose_name="Ajouter à la Fiche Société ?")
    codedb = models.CharField(max_length=3,verbose_name="Code Base Donnée", null=True)
    name = models.CharField(max_length=100, verbose_name="Raison Sociale", null=False, unique=True)
    adresse = models.TextField(max_length=300, verbose_name="Adresse", null=True)
    code_postal = models.CharField(max_length=50, verbose_name="Code Postal", null=True)
    city = models.CharField(max_length=100, verbose_name="Ville", null=False)
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, verbose_name="Pays", null=True, default='212')
    nationality = models.ForeignKey(Nationality, on_delete=models.SET_NULL, null=True, verbose_name="Nationalité", blank=True, default='212')
    national_law = models.BooleanField(default=True, verbose_name="De Droit National ?")
    ice = models.CharField(max_length=15, verbose_name="ICE", null=True, blank=True)
    identifiant_fiscal = models.CharField(max_length=10, verbose_name="Identifiant Fiscal", null=True, blank=True)
    cnss = models.CharField(max_length=10, verbose_name="Num Affiliation CNSS", null=True, blank=True)
    rc = models.CharField(max_length=10, verbose_name="Num Registre de Commerce", null=True, blank=True)
    tp = models.CharField(max_length=10, verbose_name="Num Taxe Professionnelle", null=True, blank=True)
    activity = models.TextField(max_length=300, verbose_name="Activité", null=True)

    class Month(models.IntegerChoices):
        Janvier = (1,'Janvier')
        Février = (2,'Février')
        Mars = (3,'Mars')
        Avril =(4, 'Avril')
        Mai = (5, 'Mai')
        Juin = (6, 'Juin')
        Juillet = (7, 'Juillet')
        Août = (8, 'Août')
        Septembre = (9, 'Septembre')
        Octobre = (10, 'Octobre')
        Novembre = (11, 'Novembre')
        Décembre = (12, 'Décembre')
        
    fiscal_year = models.IntegerField(verbose_name="Mois d'Ouverture Année Fiscale", choices=Month.choices, null=False, default=1)
    create_date = models.DateField(verbose_name="Date de Création", null=True, blank=True)
    
    class Statut(models.IntegerChoices):
        En_Attente = 0, ('En Attente')
        Actif = 1, ('Actif')
        Suspendu = 2, ('Suspendu')
        InActif = 3, ('InActif')

    legal_form = models.ForeignKey(LegalForm, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="Forme Juridique")
    share_capital = models.FloatField(verbose_name="Capital Social", blank=True)
    nominal_value = models.FloatField(verbose_name="Valeur Nominale", blank=True)
    currency = models.ForeignKey(Currency, on_delete=models.SET_NULL, null=True, verbose_name="Devise", default='MAD')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    terminate_date = models.DateField(verbose_name="Date de Cessation/Dissolution", null=True, blank=True)
    liquidation_date = models.DateField(verbose_name="Date de Liquidation", null=True, blank=True)
    
    def __str__(self):
        """return the name of company"""
        return self.name