import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImmobileCreateComponent } from './immobile-create.component';

describe('ImmobileCreateComponent', () => {
  let component: ImmobileCreateComponent;
  let fixture: ComponentFixture<ImmobileCreateComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ImmobileCreateComponent]
    });
    fixture = TestBed.createComponent(ImmobileCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
