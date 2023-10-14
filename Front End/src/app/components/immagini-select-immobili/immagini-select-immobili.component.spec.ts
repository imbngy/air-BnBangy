import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImmaginiSelectImmobiliComponent } from './immagini-select-immobili.component';

describe('ImmaginiSelectImmobiliComponent', () => {
  let component: ImmaginiSelectImmobiliComponent;
  let fixture: ComponentFixture<ImmaginiSelectImmobiliComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ImmaginiSelectImmobiliComponent]
    });
    fixture = TestBed.createComponent(ImmaginiSelectImmobiliComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
