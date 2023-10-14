import { Component } from '@angular/core';
import { Immagini } from '../common/immagini';
import { ImmaginiService } from '../services/immagini.service';
import { ActivatedRoute } from '@angular/router';
import { CarouselComponent } from '@coreui/angular';


@Component({
  selector: 'app-immagini-list',
  templateUrl: './immagini-list.component.html',
  styleUrls: ['./immagini-list.component.css']
})
export class ImmaginiListComponent {

  immaginis: Immagini[] = [];

  

  constructor( private immaginiService: ImmaginiService,
    private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.listImmaginis();
  }

  listImmaginis() {
    const houseId: number = +this.route.snapshot.paramMap.get('id')!;

    this.immaginiService.getImmaginiByHouseId(houseId).subscribe(
      data => {
        this.immaginis = data;
      }
    );
  }


}
