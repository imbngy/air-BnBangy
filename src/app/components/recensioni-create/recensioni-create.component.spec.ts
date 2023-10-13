import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RecensioniCreateComponent } from './recensioni-create.component';

describe('RecensioniCreateComponent', () => {
  let component: RecensioniCreateComponent;
  let fixture: ComponentFixture<RecensioniCreateComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [RecensioniCreateComponent]
    });
    fixture = TestBed.createComponent(RecensioniCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
