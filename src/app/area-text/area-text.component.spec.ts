import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AreaTextComponent } from './area-text.component';

describe('AreaTextComponent', () => {
  let component: AreaTextComponent;
  let fixture: ComponentFixture<AreaTextComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AreaTextComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AreaTextComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
