import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Aste } from 'src/app/common/aste';
import { House } from 'src/app/common/house';
import { Immagini } from 'src/app/common/immagini';
import { Utenti } from 'src/app/common/utenti';
import { AsteService } from 'src/app/services/aste.service';
import { HouseService } from 'src/app/services/house.service';
import { ImmaginiService } from 'src/app/services/immagini.service';
import { UtentiService } from 'src/app/services/utenti.service';

@Component({
  selector: 'app-house-list',
  templateUrl: './house-list-table.component.html',
  //templateUrl: './house-list.component.html',
  styleUrls: ['./house-list.component.css']
})
export class HouseListComponent {

  houses: House[] = [];
  categoria: string = '';
  previousCategoria: string = '';
  searchMode: boolean = false;

  // new properties for pagination
  thePageNumber: number = 1;
  thePageSize: number = 12;
  theTotalElements: number = 0;

  previousKeyword: string = '';

  immagine!: Immagini;
  utente!: Utenti;
  email!: string;

  lowerP: number;
  asta!: Aste;
  aste!: Aste[];


  constructor(private houseService: HouseService,
    private route: ActivatedRoute,
    private immaginiService: ImmaginiService,
    private utentiService: UtentiService,
    private router: Router,
    private asteService: AsteService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listHouses();
    });
  }

  listHouses() {
    this.searchMode = this.route.snapshot.paramMap.has('keyword');
    if (this.searchMode) {
      //do search work
      this.handleSearchHouses();
    }
    else {
      //display houses
      this.handleListHouses();
    }


  }

  handleListHouses() {
    //check if category parameter is available
    const hasCategoria: boolean = this.route.snapshot.paramMap.has('categoria');
    if (hasCategoria) {
      
      this.categoria = this.route.snapshot.paramMap.get('categoria')!;
    }
    else {
      //no category available ... default to category ''
      this.categoria = '';
    }
    if (this.categoria != this.previousCategoria && this.categoria != '') {
      this.categoria = this.route.snapshot.paramMap.get('categoria')!;
      this.previousCategoria = this.categoria;
      this.thePageNumber = 1;
      this.houseService.getHouseListCategoria(this.categoria).subscribe(
        data => {
          this.houses = data;
          this.houses.forEach(house => {
            this.immaginiService.getImmagineByHouseId(house.id).subscribe(
              data => {
                this.immagine = data;
                console.log("URLS da list:" + this.immagine.url);
                house.immagine = (this.immagine.url);
              }
            )
          }
          );

        }
      );
      

    }
    else if (this.categoria == '') {
      this.houseService.getHouseList().subscribe(
        data => {
          this.houses = data;
          this.houses.forEach(house => {
            this.immaginiService.getImmagineByHouseId(house.id).subscribe(
              data => {
                this.immagine = data;
                console.log("URLS da list:" + this.immagine.url);
                house.immagine = (this.immagine.url);
              }
            )
          });
          this.houses.forEach(house => {
            this.asteService.getAstebyIdAnnuncio(house.id).subscribe(
              data => {
                this.aste = data;
                if (this.aste.length > 0) {
                  this.asta = this.aste[this.aste.length - 1];
                }
              }
            )
          });

        }
      );
    }
  }

  handleSearchHouses() {
    const theKeyword: string = this.route.snapshot.paramMap.get('keyword')!;

    this.houseService.searchHousesPaginate(this.thePageNumber - 1,
      this.thePageSize,
      theKeyword).subscribe(data => {
        this.houses = data;
        this.houses.forEach(house => {
          this.immaginiService.getImmagineByHouseId(house.id).subscribe(
            data => {
              this.immagine = data;
              console.log("URLS da list:" + this.immagine.url);
              house.immagine = (this.immagine.url);
            }
          )
        }
        );
      }
      );
  }

  //open a mail client with the house owner email
  sendEmail(house: House) {
    this.utentiService.getUtenteById(house.idProprietario).subscribe(
      data => {
        this.utente = data;
        this.email = this.utente.email;
        window.open('mailto:' + this.email);
      }
    );
  }

  deleteHouse(id: number) {
    this.houseService.deleteHouse(id);
    this.router.navigate(['houses']);
  }

  checkIfUserIsOwner(id: number) {
    return +localStorage.getItem("id") == id;
  }

  checkIfUserIsAdmin() {
    console.log("ADMIN: " + localStorage.getItem("admin"));
    return localStorage.getItem("admin");
  }

  lowerPrice(id: number, value: number) {
    this.houseService.aggiornaPrezzo(value, id);
    window.location.reload();
  }



}
