import { Component, OnInit } from '@angular/core';
import { House } from 'src/app/common/house';
import { HouseService } from 'src/app/services/house.service';
import { ActivatedRoute, Router } from '@angular/router';
import { faFacebook, faWhatsapp, faTwitter, faLinkedin, faTelegram, faPinterest } from '@fortawesome/free-brands-svg-icons';
import { faEnvelope } from '@fortawesome/free-solid-svg-icons';
import { latLng, MapOptions, tileLayer, Map, Marker, Icon  } from 'leaflet';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { AsteService } from 'src/app/services/aste.service';
import { Aste } from 'src/app/common/aste';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'app-house-details',
  templateUrl: './house-details.component.html',
  styleUrls: ['./house-details.component.css']
})
export class HouseDetailsComponent {

  houses!: House[];
  house!: House;
  faFacebook = faFacebook;
  faWhatsapp = faWhatsapp;
  faEnvelope = faEnvelope;
  faTwitter = faTwitter;
  faLinkedin = faLinkedin;
  faTelegram = faTelegram;
  faPinterest = faPinterest;
  normalAddress!: string;
  map!: Map;
  mapOptions!: MapOptions;
  marker!: Marker;
  initLat!: number;
  initLng!: number;
  indirizzo: any;
  aste!: Aste[];
  asta!: Aste;
  lowerP!: number;
  astaP!: number;
  newPrezzoAttuale?: FormControl<string> = new FormControl('', [Validators.required, Validators.min(this.asta?.prezzoAttuale)]);


  constructor(private houseService: HouseService,
    private asteService: AsteService,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder,
    private router: Router) { }



  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.handleHouseDetails();
      this.handleAste();
      this.delay(500).then(any => {
        this.initMap();
      });
    });
  }

  updateAsta() {
    //generate a formBuilder called prezzoAsta
    //this.astaForm = this.formBuilder.group({
    //  prezzoAsta: new FormControl('', [Validators.required, Validators.min(this.asta.prezzoAttuale)])
    //});
    this.asta = new Aste(this.asta.id, this.asta.compratore, this.asta.idAnnuncio, this.asta.prezzoAttuale, this.asta.prezzoIniziale);
    if(this.asta.prezzoAttuale < +this.newPrezzoAttuale.value) {
      this.asta.prezzoAttuale = +this.newPrezzoAttuale.value;
    }
    else {
      alert("Offerta troppo bassa");
    }
    console.log("valore da input: "+ +this.newPrezzoAttuale.value);
    this.asteService.updateAsta(this.asta).subscribe(
      data => {
        console.log(data);

      }
    )
  }

  handleAste() {
    const houseId: number = +this.router.url.split("/")[2];
    console.log("asta ID: " + houseId);
    this.asteService.getAstebyIdAnnuncio(houseId).subscribe(
      data => {
        this.aste = data;
        this.asta = this.aste[0];
        console.log(this.asta);
      }
    )
  }

  startAsta(idAnnuncio: number, prezzoIniziale: number) {
    this.asta = new Aste(null, null, idAnnuncio, prezzoIniziale, prezzoIniziale);
    this.house.inAsta = true;
    this.houseService.updateHouse(this.house).subscribe(
      data => {
        console.log(data);
      }
    )
    this.asteService.createAsta(this.asta).subscribe(
      data => {
        console.log(data);
      }
    )
  }

  handleHouseDetails() {
    // get the "id" param string. convert string to a number using the "+" symbol
    const houseId: number = +this.route.snapshot.paramMap.get('id')!;

    this.houseService.getHouseById(houseId).subscribe(
      data => {
        this.houses = data;
        this.house = this.houses[0];
        console.log(this.house);
        this.normalAddress = this.house.indirizzo;
        console.log(this.normalAddress);
        const [via, citta, prov, cap] = this.normalAddress.split(";").map(s => s.trim());
        this.indirizzo = {
          via: via || '',
          citta: citta || '',
          prov: prov || '',
          cap: cap || ''
        }
        this.indirizzo.via = this.indirizzo.via.split(' ').join('+');
        this.indirizzo.citta = this.indirizzo.citta.split(' ').join('+');
        console.log("via" + this.indirizzo.via);
      }
    )
  }

  shareTo(social: string): void {
    const shareUrl = `localhost:4200/houses/${this.house.id}`;
    const shareText = `${this.house.nome}\nDescrizione: ${this.house.descrizione}\nPrezzo: ${this.house.prezzoAttuale}€`;

    switch (social) {
      case 'facebook':
        const facebookUrl = `https://www.facebook.com/sharer/sharer.php?quote=${encodeURIComponent(shareText)}`;
        window.open(facebookUrl, '_blank');
        break;

      case 'whatsapp':
        const whatsappUrl = `https://api.whatsapp.com/send?text=${encodeURIComponent(shareText + '\n' + shareUrl)}`;
        window.open(whatsappUrl, '_blank');
        break;

      case 'mail':
        const subject = encodeURIComponent(`Check out this property: ${this.house.nome}`);
        const body = encodeURIComponent(`${this.house.descrizione}\nPrice: ${this.house.prezzoAttuale}€\n\n${shareUrl}`);
        const mailtoUrl = `mailto:?subject=${subject}&body=${body}`;
        window.location.href = mailtoUrl;
        break;

      case 'twitter':
        const twitterUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(shareText + '\n' + shareUrl)}`;
        window.open(twitterUrl, '_blank');
        break;

      case 'linkedin':
        const linkedinUrl = `https://www.linkedin.com/shareArticle?mini=true&url=${encodeURIComponent(shareUrl)}&title=${encodeURIComponent(this.house.nome)}&summary=${encodeURIComponent(shareText)}`;
        window.open(linkedinUrl, '_blank');
        break;

      case 'telegram':
        const telegramUrl = `https://telegram.me/share/url?url=${encodeURIComponent(shareUrl)}&text=${encodeURIComponent(shareText)}`;
        window.open(telegramUrl, '_blank');
        break;

      case 'pinterest':
        const pinterestUrl = `https://pinterest.com/pin/create/button/?url=${encodeURIComponent(shareUrl)}&description=${encodeURIComponent(shareText)}`;
        window.open(pinterestUrl, '_blank');
        break;

      default:
        break;
    }
  }

  initMap(): void {

    var houseIcon = new Icon({
      iconUrl: 'https://cdn3.iconfinder.com/data/icons/pin-4/100/pin-512.png',
      shadowUrl: 'https://www.vilageo.com/images/marker-shadow.png',
      iconSize: [25, 41],
      iconAnchor: [12, 41],
      popupAnchor: [1, -34],
      shadowSize: [41, 41]
    });

    console.log("adssad" + this.indirizzo.citta);

    const apiUrl = `https://nominatim.openstreetmap.org/search?street=${this.indirizzo.via}&city=${this.indirizzo.citta}&county=${this.indirizzo.prov}&postalcode=${this.indirizzo.cap}&zoomOffset=1&format=json`;

    this.mapOptions = {
      layers: [
        tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors'
        })
      ],
      
      center: latLng(0, 0)
    };

    this.map = new Map('leafletMap', this.mapOptions);

    fetch(apiUrl)
      .then(response => response.json())
      .then(data => {
        if (data.length > 0) {
          const { lat, lon } = data[0];
          this.map.setView(latLng(lat, lon), 17);
          this.map.panTo(latLng(lat, lon));
          this.marker = new Marker([lat, lon]).addTo(this.map), { icon: houseIcon };
        }
      });


  }

  delay(ms: number) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  prezzoAttualeHigherThanPrezzoBase(): boolean {
    return this.house.prezzoAttuale > this.asta.prezzoIniziale;
  }
  
  deleteHouse(id: number) {
    this.houseService.deleteHouse(id);
    this.router.navigate(['houses']);
  }

  checkIfUserIsOwner(id: number) {
    return +localStorage.getItem("id") == id;
  }

  lowerPrice(id: number, value: number) {
    this.houseService.aggiornaPrezzo(value, id);
    window.location.reload();
  }

}
