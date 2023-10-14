import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router, UrlSegmentGroup } from '@angular/router';
import { ImmaginiService } from 'src/app/services/immagini.service';

@Component({
  selector: 'app-immagini-create',
  templateUrl: './immagini-create.component.html',
  styleUrls: ['./immagini-create.component.css']
})
export class ImmaginiCreateComponent {

  numeroImmagini: number = 1;
  immaginiFormGroup: FormGroup;
  urlCurrent: string = this.router.url.split('/')[2];
  doneUploading: boolean = false;


  constructor( private immaginiService: ImmaginiService,
               private formBuilder: FormBuilder,
               private route: ActivatedRoute,
               private router: Router) { 
    this.immaginiFormGroup = this.formBuilder.group({
      immagini: this.formBuilder.group({
        id_annuncio: this.urlCurrent,
        url: ''
      })
    });
   }

  ngOnInit(): void {
  }

  counter(i: number) {
    return new Array(i);
  }


  numeroAdd() {
    this.numeroImmagini++;
  }

  upload(e: Event) {
    const input = e.target as HTMLInputElement;

    if (!input.files || input.files.length == 0) {
      console.log('No file selected');
      return;
    }

    for (let i = 0; i < input.files.length; i++) {
      const file = input.files[i];
      console.log(this.urlCurrent);
      this.immaginiService.uploadimgbb(file).subscribe(
        url => {
          this.immaginiFormGroup.get('url')?.setValue(url);
          this.immaginiFormGroup.get('immagini')?.patchValue({ url: url });
          this.immaginiService.addImmagini(this.immaginiFormGroup.get('immagini').value).subscribe(
            data => {
              console.log(data);
              this.doneUploading = true;
              this.sleep(2000).then(() => {
                this.doneUploading = false;
              });
            }
          );
        }
      );
    }

  }

  backToHome() {
    this.router.navigate(['/houses']);
  }

  get id_annuncio() { return this.immaginiFormGroup.get('immagini.id_annuncio')?.value; }
  get url() { return this.immaginiFormGroup.get('immagini.url')?.value; }
  set url(url: string) { this.immaginiFormGroup.get('immagini.url')?.setValue(url); }

  sleep(ms: number) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

}
