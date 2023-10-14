import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { House } from 'src/app/common/house';
import { HouseService } from 'src/app/services/house.service';

@Component({
  selector: 'app-immagini-select-immobili',
  templateUrl: './immagini-select-immobili.component.html',
  styleUrls: ['./immagini-select-immobili.component.css']
})
export class ImmaginiSelectImmobiliComponent {

  myhouses: House[] = [];


  constructor(private houseService: HouseService,
    private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listMyHouses(+localStorage.getItem('id')!);
    });
  }

  listMyHouses(id: number) {
    this.houseService.getHouseListByUserId(id).subscribe(
      data => {
        this.myhouses = data;
      }
    )
  }

}

