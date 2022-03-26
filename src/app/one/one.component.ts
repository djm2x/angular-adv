import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-one',
  templateUrl: './one.component.html',
  styleUrls: ['./one.component.scss']
})
export class OneComponent implements OnInit {

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    const api = 'https://api.github.com';

    const url = 'repos/elabdellah/TransNow_API_Authentication/actions/runs'
    this.http.get<any[]>(`${api}/${url}`).subscribe(r => {
      console.log(r);
    });
  }

}
