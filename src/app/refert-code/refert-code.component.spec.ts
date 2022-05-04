import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RefertCodeComponent } from './refert-code.component';

describe('RefertCodeComponent', () => {
  let component: RefertCodeComponent;
  let fixture: ComponentFixture<RefertCodeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RefertCodeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RefertCodeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
