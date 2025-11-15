<?php

use App\JenisTransaksi;
use App\MasterBarang;
use App\RoleUser;
use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        try {
            $roleUser = [
                [
                    'role' => 'Admin',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
                [
                    'role' => 'User',
                    'created_at' => now(),
                    'created_by' => 'System',
                ]
            ];
            RoleUser::insert($roleUser);

            $user = [
                [
                    'id_role' => 1,
                    'username' => 'admin',
                    'password' => Hash::make('admin123'),
                ],
                [
                    'id_role' => 2,
                    'username' => 'user',
                    'password' => Hash::make('user123'),
                ],
            ];
            User::insert($user);

            $jenisTransaksi = [
                [
                    'jenis_transaksi' => 'Barang Masuk',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
                [
                    'jenis_transaksi' => 'Barang Keluar',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
            ];
            JenisTransaksi::insert($jenisTransaksi);

            $masterBarang = [
                [
                    'nama_barang' => 'Mie Sedaap Goreng',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
                [
                    'nama_barang' => 'Mie Sedaap Soto',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
                [
                    'nama_barang' => 'Mie Sedaap Kari Spesial',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
                [
                    'nama_barang' => 'Mie Sedaap Ayam Bawang',
                    'created_at' => now(),
                    'created_by' => 'System',
                ],
            ];
            MasterBarang::insert($masterBarang);
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }
}
