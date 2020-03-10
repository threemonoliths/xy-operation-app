import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';

import { baseUrl } from '../../config';
import { formmat } from '../../utils/formmat';



@Injectable()
export class UserService {
  constructor(private http: HttpClient) { }
  url = baseUrl + 'users';

  user: any = null;
  isUpdate = false;

  listOnePage(q: any) {
    return this.http.get(this.url, { params: formmat(q) });
  }

  getById(id) {
    return this.http.get(this.url + `/${id}`);
  }

  add(obj) {
    return this.http.post(this.url, obj);
  }

  update(id, obj) {
    return this.http.put(this.url + `/${id}`, obj);
  }

  delete(id) {
    return this.http.delete(this.url + `/${id}`);
  }

  getAllPermissions() {
    return this.http.get(this.url + `/permissions/all`);
  }
}
