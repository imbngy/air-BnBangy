import { NotExpr } from '@angular/compiler';
import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Recensioni } from 'src/app/common/recensioni';
import { ImAuthService } from 'src/app/services/im-auth.service';
import { RecensioniService } from 'src/app/services/recensioni.service';

@Component({
  selector: 'app-recensioni-list',
  templateUrl: './recensioni-list.component.html',
  styleUrls: ['./recensioni-list.component.css']
})
export class RecensioniListComponent {

  recensioni: Recensioni[] = [];

  constructor( private recensioniService: RecensioniService,
     private route: ActivatedRoute,
     public imAuth: ImAuthService ) { }


  ngOnInit(): void {
    this.listRecensionis();
  }

  listRecensionis() {
    const theHouseId: number = +this.route.snapshot.paramMap.get('id')!;

    this.recensioniService.getRecensioniByHouseId(theHouseId).subscribe(
      data => {
        this.recensioni = data;
      }
    );
  }

  checkReviewOwner(recensioni: Recensioni){
    return recensioni.idUtente == +localStorage.getItem('id');
  }

  del(id: number) {
    this.recensioniService.deleteRecensione(id).subscribe({
      next: () => window.location.reload(),
      error: err => console.log(err)
    })
  }

}
