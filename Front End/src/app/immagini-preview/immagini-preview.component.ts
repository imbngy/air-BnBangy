import { Component, Input } from '@angular/core';
import { Immagini } from '../common/immagini';
import { ImmaginiService } from '../services/immagini.service';
import { ActivatedRoute } from '@angular/router';
import { House } from '../common/house';
import { HouseService } from '../services/house.service';

@Component({
  selector: 'app-immagini-preview',
  templateUrl: './immagini-preview.component.html',
  styleUrls: ['./immagini-preview.component.css']
})
export class ImmaginiPreviewComponent {

  immagini: Immagini[] = [];
  immagine!: Immagini;
  houses!: House[];

  constructor( private immaginiService: ImmaginiService,
    private houseService: HouseService) { }

  ngOnInit(): void {
    this.getFirstImageFromHouses();
  }

  getFirstImageFromHouses() {
    this.houseService.getHouseList().subscribe(
      data => {
        this.houses = data;
        this.houses.forEach(house => {
          this.immaginiService.getImmagineByHouseId(house.id).subscribe(
            data => {
              this.immagine = data;
              this.immagini.push(this.immagine);
            }
          )
        });
      }
    )
  }

}
