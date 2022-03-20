import { TwoComponent } from './two/two.component';
import { OneComponent } from './one/one.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: 'one', pathMatch: 'full' },
  {path: 'one', component: OneComponent},
  {path: 'two', component: TwoComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    initialNavigation: 'enabledBlocking'
})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
