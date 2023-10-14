import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminPanelManageComponent } from './admin-panel-manage.component';

describe('AdminPanelManageComponent', () => {
  let component: AdminPanelManageComponent;
  let fixture: ComponentFixture<AdminPanelManageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AdminPanelManageComponent]
    });
    fixture = TestBed.createComponent(AdminPanelManageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
