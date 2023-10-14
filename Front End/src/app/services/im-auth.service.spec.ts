import { TestBed } from '@angular/core/testing';

import { ImAuthService } from './im-auth.service';

describe('ImAuthService', () => {
  let service: ImAuthService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ImAuthService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
