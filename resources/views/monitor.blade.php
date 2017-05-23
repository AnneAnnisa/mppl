@extends('include.master')

@section('content')
<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper" style="background: white none repeat scroll 0% 0%; height: 100px; min-height: 100px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Data Saat Ini
    </h1>
  </section>

  <!-- Main content -->
  <section class="content" style="background: white none repeat scroll 0% 0%; height: 100px; min-height: 100px;">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              
              <h3>{{$diterima}}</h3>

              <p>Diterima</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-stalker"></i>
            </div>
            <a href="/magangditerima" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>{{$wawancara}}</h3>

              <p>Wawancara</p>
            </div>
            <div class="icon">
              <i class="ion ion-android-people"></i>
            </div>
            <a href="/magangditerima" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{{$pendaftar}}</h3>

              <p>Pendaftar</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="/seleksipelamar" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{{$belum}}</h3>

              <p>Belum Diproses</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-people"></i>
            </div>
            <a href="/pelamarditolak" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
    </section>
</div>
    
@endsection
