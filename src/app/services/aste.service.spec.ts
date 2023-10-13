import { TestBed } from '@angular/core/testing';

import { AsteService } from './aste.service';

describe('AsteService', () => {
  let service: AsteService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AsteService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
