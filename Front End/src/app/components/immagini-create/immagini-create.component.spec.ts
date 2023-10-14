import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImmaginiCreateComponent } from './immagini-create.component';

describe('ImmaginiCreateComponent', () => {
  let component: ImmaginiCreateComponent;
  let fixture: ComponentFixture<ImmaginiCreateComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ImmaginiCreateComponent]
    });
    fixture = TestBed.createComponent(ImmaginiCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
