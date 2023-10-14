import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HouseListComponent } from './components/house-list/house-list.component';
import { HttpClientModule } from '@angular/common/http';
import { HouseService } from './services/house.service';

import { Routes, RouterModule } from '@angular/router';
import { SearchComponent } from './components/search/search.component';
import { HouseDetailsComponent } from './components/house-details/house-details.component';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { Immagini } from './common/immagini';
import { ImmaginiService } from './services/immagini.service';
import { ImmaginiListComponent } from './immagini-list/immagini-list.component';
import { ImmaginiPreviewComponent } from './immagini-preview/immagini-preview.component';
import { RecensioniListComponent } from './components/recensioni-list/recensioni-list.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { MatIconModule } from '@angular/material/icon';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { RatingModule } from 'primeng/rating';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RegisterComponent } from './components/register/register.component';
import { CookieService } from 'ngx-cookie-service';
import { ImAuthService } from './services/im-auth.service';
import { RecensioniCreateComponent } from './components/recensioni-create/recensioni-create.component';
import { ImmobileCreateComponent } from './components/immobile-create/immobile-create.component';
import { ImmaginiCreateComponent } from './components/immagini-create/immagini-create.component';
import { ImmaginiSelectImmobiliComponent } from './components/immagini-select-immobili/immagini-select-immobili.component';
import { GalleriaModule } from 'primeng/galleria';
import { TagModule } from 'primeng/tag';
import { CarouselModule } from '@coreui/angular';
import { IconModule} from '@coreui/icons-angular';
import { AdminPanelComponent } from './components/admin-panel/admin-panel.component';
import { AdminPanelDetailsComponent } from './components/admin-panel-details/admin-panel-details.component';
import { AdminPanelManageComponent } from './components/admin-panel-manage/admin-panel-manage.component';


const routes: Routes = [

  { path: 'adminPanel', component: AdminPanelComponent },
  { path: 'adminPanel/:id', component: AdminPanelManageComponent },
  { path: 'createImmobile', component: ImmobileCreateComponent },
  { path: 'aggiungiImmagini', component: ImmaginiSelectImmobiliComponent },
  { path: 'aggiungiImmagini/:id', component: ImmaginiCreateComponent },
  { path: 'search/:keyword', component: HouseListComponent },
  { path: 'categoria/:categoria', component: HouseListComponent },
  { path: 'categoria', component: HouseListComponent },
  { path: 'houses/:id', component: HouseDetailsComponent },
  { path: 'houses', component: HouseListComponent },
  { path: '', redirectTo: '/houses', pathMatch: 'full' },
  { path: '**', redirectTo: '/houses', pathMatch: 'full' }
];
@NgModule({
  declarations: [
    AppComponent,
    HouseListComponent,
    SearchComponent,
    HouseDetailsComponent,
    ImmaginiListComponent,
    ImmaginiPreviewComponent,
    RecensioniListComponent,
    RegisterComponent,
    RecensioniCreateComponent,
    ImmobileCreateComponent,
    ImmaginiCreateComponent,
    ImmaginiSelectImmobiliComponent,
    AdminPanelComponent,
    AdminPanelManageComponent,
  ],
  imports: [
    RouterModule.forRoot(routes),
    BrowserModule,
    HttpClientModule,
    NgbModule,
    BrowserAnimationsModule,
    FontAwesomeModule,
    MatIconModule,
    LeafletModule,
    RatingModule,
    FormsModule,
    ReactiveFormsModule,
    GalleriaModule,
    TagModule,
    CarouselModule,
    IconModule,
    RouterModule
  ],
  providers: [HouseService, ImmaginiService, ImAuthService], 
  bootstrap: [AppComponent]
})
export class AppModule { }
