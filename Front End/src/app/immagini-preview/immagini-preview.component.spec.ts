import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImmaginiPreviewComponent } from './immagini-preview.component';

describe('ImmaginiPreviewComponent', () => {
  let component: ImmaginiPreviewComponent;
  let fixture: ComponentFixture<ImmaginiPreviewComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ImmaginiPreviewComponent]
    });
    fixture = TestBed.createComponent(ImmaginiPreviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
