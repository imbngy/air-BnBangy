import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { House } from 'src/app/common/house';
import { HouseService } from 'src/app/services/house.service';

@Component({
  selector: 'app-admin-panel-details',
  templateUrl: './admin-panel-details.component.html',
  styleUrls: ['./admin-panel-details.component.css']
})
export class AdminPanelDetailsComponent {

  houses: House[] = [];

  constructor( private houseService: HouseService,
               private route: ActivatedRoute,
               private router: Router) { }

  ngOnInit(): void {
    this.listHousesByOwnerId();
  }

  listHousesByOwnerId() {
    const ownerId: number = +this.router.url.split('/')[2];
    this.houseService.getHouseListByUserId(ownerId).subscribe(
      data => {
        this.houses = data;
      }
    )
  }

  deleteHouse(id: number) {
    this.houseService.deleteHouse(id).subscribe(
      data => {
        console.log(data);
        this.listHousesByOwnerId();
      }
    )
  }

}
