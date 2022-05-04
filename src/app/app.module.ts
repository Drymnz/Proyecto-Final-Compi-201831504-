import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {routing} from './app.router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AreaTextComponent } from './area-text/area-text.component';
import { MenuComponent } from './menu/menu.component';
import { ArchivosComponent } from './archivos/archivos.component';
import { IdeComponent } from './ide/ide.component';
import { ReportComponent } from './report/report.component';
import { ImageCollectionComponent } from './image-collection/image-collection.component';
import { ConsoleComponent } from './console/console.component';
import { CodeFileDirective } from './code-file.directive';
import { RefertCodeComponent } from './refert-code/refert-code.component';

@NgModule({
  declarations: [
    AppComponent,
    AreaTextComponent,
    MenuComponent,
    ArchivosComponent,
    IdeComponent,
    ReportComponent,
    ImageCollectionComponent,
    ConsoleComponent,
    CodeFileDirective,
    RefertCodeComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    routing
  ],
  entryComponents:[
    RefertCodeComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
