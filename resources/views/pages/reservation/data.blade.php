@extends('layouts.main')
@section('content')
<h1>Reservasi</h1>
<hr>
<!-- Alert -->
@if(session('status-alert') == 'sukses')
<div class="alert alert-success alert-dismissible fade show" role="alert">
	<strong>Berhasil disimpan !</strong> Data telah berhasil disimpan kedalam database.
	<a href="{{route('invoice',['kode'=>session('kode')])}}" target="_blank" class="btn btn-sm btn-primary"><span class="fas fa-aw fa-print"></span> Cetak Invoice</a>
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
@endif

@if(session('status-alert') == 'sukses-hapus')
<div class="alert alert-success alert-dismissible fade show" role="alert">
	<strong>Berhasil dihapus !</strong> Data telah berhasil dihapus dari database.
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
@endif

@if(session('status-alert') == 'gagal')
<div class="alert alert-danger alert-dismissible fade show" role="alert">
	<strong>Gagal dihapus !</strong> Data gagal dihapus pada database, silahkan ulangi kembali.
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
@endif

<!-- Pencarian dan Tambah -->

<div class="row">
	<div class="col-sm-6 mb-3">
		<form method="get" action="?">
			<div class="input-group">
				<input type="text" name="cari" placeholder="Cari..." class="form-control" value="{{ $cari }}" />
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary">Go!</button>
				</div>
			</div>
		</form>
	</div>

	<div class="col-sm-6 text-right mb-3">
		<a href="{{ route('customer.data') }}" class="btn btn-primary">+Tambah</a>
	</div>

</div>

<!-- Data tabel-->
<?php 
$tool = new App\Library\Tools;
 ?>
<table class="table table-striped table-sm">
	<thead>
		<tr>
			<th>Pelanggan</th>
			<th>Info</th><th>Harga</th><th>Tanggal Reservasi</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	@foreach($data as $field)
		<tr>
			<td>
				<u>{{ $field->name }}</u><br>
				<small>{{$field->reservation_code}}</small>
			</td>
			<td>
				<u>Jadwal : {{$tool->dateformat($field->depart_at,'d M Y H:i:s')}}</u><br>
				<small>
					{{$field->seat_code}}/{{$field->code}} {{$field->type}}
				</small>
			</td>
			<td>
				<u>Rp. {{number_format($field->price,0,',','.')}} ,-</u><br>
				<small>
					{{$field->rute_from}} -> {{$field->rute_to}}
				</small>
			</td>
			<td>
				<?php 
				$dateres = $field->reservation_date.' '.$field->reservation_at;
				 ?>
				 {{$tool->dateformat($dateres,'d M Y H:i:s')}} <br>
				 <small>{{$field->fullname}}</small>
			</td>
			<td class="text-right">

				<a href="{{route('invoice',['kode'=>$field->reservation_code])}}" class="btn btn-sm btn-primary" target="_blank">
					<span class="fas fa-aw fa-print"></span>
				</a>		
				
			</td>
		</tr>
	@endforeach

	</tbody>
</table>

<!-- Halaman / Pagging-->

{{ $data->appends(['cari'=>$cari])->links('vendor.pagination.bootstrap-4') }}



@endsection