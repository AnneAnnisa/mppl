@extends('include.master')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Seleksi Pendaftar
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">Data Pendaftar</h3>
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
                      <th class="col-md-3">Nama</th>
                      <th class="col-md-2">NIM</th>
                      <th class="col-md-2">Email</th>
                      <th class="col-md-2">Telp</th>
                      <th class="col-md-2">Universitas</th>
                      <th class="col-md-1">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach($pendaftar as $index => $pend)
                  <tr data-divisi="{{$pend->id_pendaftar}}">
                    <td>{{$pend->nama}}</td>
                    <td>{{$pend->nim}}</td>
                    <td>{{$pend->email}}</td>
                    <td>{{$pend->telp}}</td>
                    <td>{{$pend->pendidikan->universitas}}</td>
                    <td>
                      @if($pend->id_wawancara == NULL)
                      <!-- <a href="#lolos" class="lolos" id="lol{{$pend->id_pendaftar}}" data-temp="1" data-pendid="{{$pend->id_pendaftar}}" data-toggle="modal" data-target="#lolos{{$pend->id_pendaftar}}"\><span class="glyphicon glyphicon-ok" style="color:green" title="lolos"></span></a> -->

                      <a href="#lolos" onclick="event.preventDefault(); document.getElementById('lolos-form{{$pend->id_pendaftar}}').submit();"><span class="glyphicon glyphicon-ok" style="color:green" title="lolos"></span></a>
                      <form id="lolos-form{{$pend->id_pendaftar}}" action="{{ url('/seleksi/lolos') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                          <input class="form-control" name="idpend" type="text" value="{{$pend->id_pendaftar}}">
                      </form>

                      <a href="#gagal" onclick="event.preventDefault(); document.getElementById('gagal-form{{$pend->id_pendaftar}}').submit();"><span class="glyphicon glyphicon-remove" style="color:red" title="gagal"></span></a>
                      <form id="gagal-form{{$pend->id_pendaftar}}" action="{{ url('/seleksi/gagal') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                          <input class="form-control" name="idpend" type="text" value="{{$pend->id_pendaftar}}">
                          <!-- <input class="form-control" name="temp" type="text" value="1"> -->
                      </form>
                      <a href="#pendf" class="hehe" id="hehe{{$pend->id_pendaftar}}" data-temp="1" data-pendid="{{$pend->id_pendaftar}}" data-toggle="modal" data-target="#nilai{{$pend->id_pendaftar}}"\><span class='fa fa-file' title="lihat data" style="color:navy"></span></a>
                      <a href="#hap" onclick="event.preventDefault(); document.getElementById('haps-form{{$pend->id_pendaftar}}').submit();"><span class='fa fa-trash' title="hapus data" style="color:red"></span></a>
                      <form id="haps-form{{$pend->id_pendaftar}}" action="{{ url('/seleksi/hapus') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                          <input class="form-control" name="pendidhap" type="text" value="{{$pend->id_pendaftar}}">
                          <!-- <input class="form-control" name="temp" type="text" value="1"> -->
                      </form>
                      @else
                        @if($pend->wawancara->status == 99)
                          <label style="color:red">GAGAL</label>
                          <a href="#reset" onclick="event.preventDefault(); document.getElementById('hapsz-form{{$pend->id_wawancara}}').submit();"><span class="glyphicon glyphicon-remove" style="color:red" title="cancel"></span></a>
                          <form id="hapsz-form{{$pend->id_wawancara}}" action="{{ url('/seleksi/reset') }}" method="POST" style="display: none;">
                              {{ csrf_field() }}
                              <input class="form-control" name="pendidhap" type="text" value="{{$pend->id_wawancara}}">
                          </form>
                        @elseif($pend->wawancara->status == 0)
                          <label style="color:green">WWNCR</label>
                          <a href="#reset" onclick="event.preventDefault(); document.getElementById('hapsz-form{{$pend->id_wawancara}}').submit();"><span class="glyphicon glyphicon-remove" style="color:red" title="cancel"></span></a>
                          <form id="hapsz-form{{$pend->id_wawancara}}" action="{{ url('/seleksi/reset') }}" method="POST" style="display: none;">
                              {{ csrf_field() }}
                              <input class="form-control" name="pendidhap" type="text" value="{{$pend->id_wawancara}}">
                          </form>
                        @elseif($pend->wawancara->status == 1)
                          <label style="color:blue">LOLOS</label>
                        @endif
                      @endif
                    </td>

<!-- MODAL TANGGAL BLM JADI
                    <div class="modal fade" id="lolos{{$pend->id_pendaftar}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Masukan Tanggal</h4>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <form method="post" action="{{ url('/seleksi/lolos') }}">
                                <input class="form-control" id="ambilnih" name="idpend" type="hidden" value="{{$pend->id_pendaftar}}">
                                <div class="container">
                                    <div class="row">
                                        <div class='col-sm-6'>
                                            <input type='text' class="form-control" id="tglwawan{{$pend->id_pendaftar}}" name="tanggal" data-tang="{{$pend->id_pendaftar}}" />
                                        </div>
                                    </div>
                                </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
 -->

                      <div class="modal fade" id="nilai{{$pend->id_pendaftar}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <h4 class="modal-title" id="myModalLabel">Data Pendaftar</h4>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <form method="post" action="#">
                                  {{csrf_field()}}
                                  <input type="hidden" name="id_pendaftar" value="{{$pend->id_pendaftar}}">
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label>Nama</label>
                                      <input class="form-control" name="nama" type="text" value="{{$pend->nama}}" required="" disabled>
                                    </div>
                                    <div class="form-group">
                                      <label>NIM</label>
                                      <input class="form-control" name="nim" type="text" value="{{$pend->nim}}" required="" disabled>
                                    </div>
                                    <div class="form-group">
                                      <div class="row">
                                        <div class="col-md-6">
                                          <label>Universitas</label>
                                          <input class="form-control" name="univ" type="text" value="{{$pend->pendidikan->universitas}}" required="" disabled>
                                        </div>
                                        <div class="col-md-6">
                                          <label>Jurusan</label>
                                          <input class="form-control" name="jur" type="text" value="{{$pend->pendidikan->jurusan}}" required="" disabled>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <label>Fakultas</label>
                                      <input class="form-control" name="fak" type="text" value="{{$pend->pendidikan->fakultas}}" disabled>
                                    </div>
                                    <div class="form-group">
                                      <label>Email</label>
                                      <input class="form-control" name="email" type="text" value="{{$pend->email}}" disabled>
                                    </div>
                                    <div class="form-group">
                                      <label>No. Telepon</label>
                                      <input class="form-control" name="telp" type="text" value="{{$pend->telp}}" disabled>
                                    </div>

                                  </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label>Alamat</label>
                                      <input class="form-control" name="alamat" type="text" value="{{$pend->alamat}}" disabled>
                                    </div>
                                    <div class="form-group">
                                      <label>Alasan Mendaftar</label>
                                      <textarea rows="4" class="form-control" name="alasan" type="text" id="alasan" disabled>{{$pend->alasan}}</textarea>
                                    </div>
                                    <div class="form-group" style="text-align:center;"> 
                                      <div class="col-md-6">
                                        <label for="message" class="control-label">Foto Pendaftar</label>
                                        <img src="{{url('/img')}}/{{$pend->path_foto}}" class="img-responsive voc_list_preview_img center-block" alt="User Image" style="max-height:200px;">
                                      </div>
                                      <div class="col-md-6">
                                        <label for="message" class="control-label">Unduh CV Pendaftar</label>
                                         <a href="{{url('/CV')}}/{{$pend->path_cv}}"><img src="{{url('/img/download.ico')}}" class="img-responsive voc_list_preview_img center-block" alt="User Image" style="margin-top:25px; max-height:100px;"></a>
                                      </div>
                                    </div>
                                  </div>

                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                  </tr>
                  @endforeach
                  </tbody>
                </table>

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

var article = document.getElementById('ambilnih');
var res = article.value;
alert(res);
$('#tglwawan'+res).datetimepicker({
  format: 'YYYY-MM-DD',
  useCurrent: false,
  allowInputToggle: true
  
});
</script>


@endsection
