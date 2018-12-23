@extends('layouts.main')
@section('content')
<h1>Transportasi</h1>
<hr>

<!-- Alert -->
@if(session('status-alert') == 'peringatan')
<div class="alert alert-warning alert-dismissible fade show" role="alert">
	<strong>Oups, ada kesalahan !</strong> Data gagal disimpan, karena ada kesalah silahkan check kembali.
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

<!-- Formulir  -->
<div class="card border-info mb-3">
	<div class="card-header bg-info text-white">Tambah Transportasi</div>
	<div class="card-body">
		<form method="post" action="{{route('transportation.update')}}">
		{{csrf_field()}}
		<input type="hidden" name="id" value="{{$field->id}}">
			<div class="form-group">
				<label>Tipe Transportasi</label>
				<div class="row">
					<div class="col-sm-4">
					<select class="form-control {{$errors->has('tipe')?'is-invalid':''}}" name="tipe" required autofocus>
						<option value="">Pilih</option>
						<?php 
							$val = Request::old('tipe',$field->transportation_typeid);
							$res = App\TransportationType::orderBy('description','asc')->get();
						 ?>
						 @foreach($res as $opt)
						 	<option value="{{$opt->id}}" {{$val==$opt->id?'selected':''}}>
						 		{{$opt->description}}
						 	</option>
						 @endforeach
					</select>

					@if($errors->has('tipe'))
					<div class="invalid-feedback">
						{{$errors->first('tipe')}}
					</div>
					@endif
					</div>
				</div>
			</div>

			<div class="form-group">
				<label>Kode/ Nama Transportasi</label>
				<div class="row">
					<div class="col-sm-6">
					<input type="text" name="kode" class="form-control {{$errors->has('kode')?'is-invalid':''}}" value="{{ Request::old('kode',$field->code) }}" required />

					@if($errors->has('kode'))
					<div class="invalid-feedback">
						{{$errors->first('kode')}}
					</div>
					@endif
					</div>
				</div>
				<small>
					Panjang Karakter 3-50, Contoh : Pandawa Lima
				</small>
			</div>
			
			<div class="form-group">
				<label>Deskripsi</label>
				<div class="row">
					<div class="col-sm-6">
					<input type="text" name="deskripsi" class="form-control {{$errors->has('deskripsi')?'is-invalid':''}}" value="{{ Request::old('deskripsi',$field->description) }}" required autofocus />

					@if($errors->has('deskripsi'))
					<div class="invalid-feedback">
						{{$errors->first('deskripsi')}}
					</div>
					@endif
					</div>
				</div>
				<small>
					Panjang Karakter 3-50, Contoh : PT. Garuda Indonesia
				</small>
			</div>

			<div class="form-group">
				<label>Kapasitas Tempat Duduk</label>
				<div class="row">
					<div class="col-sm-2">
					<input type="number" name="kapasitas" class="form-control {{$errors->has('kapasitas')?'is-invalid':''}}" value="{{ Request::old('kapasitas',$field->seat_qty) }}" required autofocus />

					@if($errors->has('kapasitas'))
					<div class="invalid-feedback">
						{{$errors->first('kapasitas')}}
					</div>
					@endif
					</div>
				</div>
				<small>
					Panjang Karakter 1-5, Contoh : 100
				</small>
			</div>

			<hr>
			<div class="form-group text-right">
				<p>
					Pilih "Simpan" apabila akan menyimpan data yang dimasukan pada formulir diatas.
				</p>
				<a href="{{route('transportation.data')}}" class="btn btn-secondary">Cancel</a>
				<button type="submit" class="btn btn-info">Simpan</button>
			</div>

		</form>
	</div>
	<div class="card-footer bg-info"></div>
</div>

@endsection