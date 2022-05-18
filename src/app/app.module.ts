import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import {routing} from './app.router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MenuComponent } from './menu/menu.component';
import { ArchivosComponent } from './archivos/archivos.component';
import { IdeComponent } from './ide/ide.component';
import { ReportComponent } from './report/report.component';
import { ImageCollectionComponent } from './image-collection/image-collection.component';
import { ConsoleComponent } from './console/console.component';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { GraficaComponent } from './grafica/grafica.component';//investigar para usar formularios

@NgModule({
  declarations: [
    AppComponent,
    MenuComponent,
    ArchivosComponent,
    IdeComponent,
    ReportComponent,
    ImageCollectionComponent,
    ConsoleComponent,
    GraficaComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    routing,
    FormsModule,
    ReactiveFormsModule
  ],
  entryComponents:[
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
