@extends('include.master')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Pendidikan
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">Data Pendidikan Terdaftar</h3>
              </div>
              <div class="box-body table-responsive" style="overflow: auto; overflow-y:hidden; max-height: 100%;">

<div class="apus">
            @if (session('status'))
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  {{ session('status') }}
              </div>
            @endif
</div>

                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th class="col-md-4">Universitas</th>
                      <th class="col-md-4">Fakultas</th>
                      <th class="col-md-3">Jurusan</th>
                      <th class="col-md-1">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($pendidikan as $index => $pend)
                  <tr data-divisi="{{$pend->id_pendidikan}}">
                    <td>{{$pend->universitas}}</td>
                    <td>{{$pend->fakultas}}</td>
                    <td>{{$pend->jurusan}}</td>
                    <td>
                      <a href="#pend" class="hehedit" id="hehe{{$pend->id_pendidikan}}" data-temp="1" data-pendid="{{$pend->id_pendidikan}}" data-univ="{{$pend->universitas}}" data-fak="{{$pend->fakultas}}" data-jur="{{$pend->jurusan}}" data-alamat="{{$pend->alamat_jurusan}}" data-telp="{{$pend->telp_jurusan}}"><span class='fa fa-file' title="lihat data" style="color:navy"></span>  <span class='fa fa-edit' title="edit data" style="color:orange"></span></a>
                      <a href="#hap" onclick="event.preventDefault(); document.getElementById('haps-form{{$pend->id_pendidikan}}').submit();"><span class='fa fa-trash' title="hapus data" style="color:red"></span></a>
                      <form id="haps-form{{$pend->id_pendidikan}}" action="{{ url('/pendidikan/hapus') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                          <input class="form-control" name="pendidhap" type="text" value="{{$pend->id_pendidikan}}">
                          <!-- <input class="form-control" name="temp" type="text" value="1"> -->
                      </form>
                    </td>
                  </tr>
                  @endforeach
                  </tbody>
                </table>

              </div>
            </div>
          </div>
        </div>
      </div>


      <div class="col-md-6" id="isitambah">
        <div class="row">
          <div class="col-md-12">
            <div class="box" style="overflow: auto; overflow-x: hidden; max-height: 100%;">
              <div class="box-header" id="ganti-form" data-formm="0">
                <h3 class="box-title" id="ganti-judul" data-tambah="0">Tambah Data Pendidikan</h3>
                <div class="row" >        
                  <div class="col-md-12">
                    <form action="{{ url('/pendidikan/tambah')}}" method="POST" id="formganti" style="margin-bottom:0;">
                      <div class="box-body">
                        {{ csrf_field() }}

                        <div class="apus">
                        @if (count($errors) > 0)
                        <div class="alert alert-danger">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                          <ul>
                            @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                          </ul>
                        </div>
                        @endif
                        
                        @if (session('status1'))
                          <div class="alert alert-info">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              {{ session('status1') }}
                          </div>
                        @endif

                        @if (session('status2'))
                          <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              {{ session('status2') }}
                          </div>
                        @endif
                        </div>


                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label>Universitas</label>
                                <input class="form-control" name="univ" type="text" id="univ" placeholder="ex : Institut Teknologi Sepuluh Nopember">
                              </div>
                              <div class="form-group">
                                <label>Fakultas</label>
                                <input class="form-control" name="fak" type="text" id="fak" placeholder="ex : Fakultas Teknologi Informasi">
                              </div>
                              <div class="form-group">
                                <label>Jurusan</label>
                                <input class="form-control" name="jur" type="text" id="jur" placeholder="ex : Teknik Informatika">
                              </div>
                            </div>
                            <div class="col-md-6"> 
                              <div class="form-group">
                                <label>Alamat Jurusan</label>
                                <textarea rows="4" class="form-control" name="alamat" type="text" id="alamat" placeholder="ex : Jl. Teknik Informatika 123"></textarea>
                              </div>
                              <div class="form-group">
                                <label>Telepon Jurusan</label>
                                <input class="form-control" name="telp" type="number" id="telp" placeholder="ex : 1234567">
                                <input class="form-control" name="pendid" type="hidden" id="pendid" placeholder="ex : 1234567">
                              </div>
                            </div>
                          </div>
                      </div>
                        <div class="modal-footer" id="foot">
                          <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


    </div>
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@section('js')
<script type="text/javascript">

  var judul = document.getElementById("ganti-judul");
  if(judul.dataset.tambah == 0)
  {
    var isitambah = document.getElementById("isitambah");
    var clonee0 = isitambah.cloneNode(true);
  }

  $('.hehedit').on('click', function(event){

      var judul = document.getElementById("ganti-judul");
      judul.innerHTML='Edit Data Pendidikan';

      var formgan = document.getElementById("formganti");
      formgan.action="{{ url('/pendidikan/update')}}";

      document.getElementById("univ").value=this.dataset.univ;
      document.getElementById("fak").value=this.dataset.fak;
      document.getElementById("jur").value=this.dataset.jur;
      document.getElementById("alamat").value=this.dataset.alamat;
      document.getElementById("telp").value=this.dataset.telp;
      document.getElementById("pendid").value=this.dataset.pendid;

      // JQUERY
      // $('#nip1').val(this.dataset.nip);
      // $('#nip11').val(this.dataset.nip);

      // alert(judul.dataset.tambah);

      if(judul.dataset.tambah == 0)
      {    
        var fooo = document.getElementById("foot");
        var but2 = document.createElement('button');

        but2.setAttribute('onclick', "balikcoy()");
        but2.setAttribute('class', 'btn btn-danger');
        but2.setAttribute('type','button');
        but2.innerHTML='Cancel';
        fooo.appendChild(but2);

        judul.dataset.tambah = 1;
      }
  });
  function balikcoy()
  {
      var hhh = document.getElementById("isitambah");
      hhh.innerHTML = clonee0.innerHTML;
      $('.apus').empty();
  }

</script>


@endsection
