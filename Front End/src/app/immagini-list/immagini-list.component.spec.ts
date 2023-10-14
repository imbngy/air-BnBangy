import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImmaginiListComponent } from './immagini-list.component';

describe('ImmaginiListComponent', () => {
  let component: ImmaginiListComponent;
  let fixture: ComponentFixture<ImmaginiListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ImmaginiListComponent]
    });
    fixture = TestBed.createComponent(ImmaginiListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
