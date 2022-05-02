import {RouterModule, Routes} from "@angular/router"
import { IdeComponent } from "./ide/ide.component";
import { ImageCollectionComponent } from "./image-collection/image-collection.component";
import { ReportComponent } from "./report/report.component";
const appRoutes: Routes = [
    {path:'ide',component:IdeComponent},
    {path:'image-collection',component:ImageCollectionComponent},
    {path:'repot',component:ReportComponent}
];
export const routing = RouterModule.forRoot(appRoutes);