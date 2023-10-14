import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { House } from 'src/app/common/house';
import { HouseService } from 'src/app/services/house.service';
import { ImAuthService } from 'src/app/services/im-auth.service';

@Component({
  selector: 'app-admin-panel-manage',
  templateUrl: './admin-panel-manage.component.html',
  styleUrls: ['./admin-panel-manage.component.css']
})
export class AdminPanelManageComponent {
  houses: House[] = [];

  constructor( private houseService: HouseService,
               private route: ActivatedRoute,
               private router: Router,
               private imAuth: ImAuthService) { }

  ngOnInit(): void {
    if (!this.imAuth.isAdmin()) {
      this.router.navigate(['/']);
    }
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
        window.location.reload();
      }
    )
  }
}
