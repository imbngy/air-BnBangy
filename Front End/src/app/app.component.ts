import { Component } from '@angular/core';
import { ImAuthService } from './services/im-auth.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular-immobiliare';

  constructor( public imAuth: ImAuthService,
               private route: ActivatedRoute) { }

  ngOnInit(): void {
  }

}
