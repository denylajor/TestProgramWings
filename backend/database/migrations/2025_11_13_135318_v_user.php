<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class VUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("DROP VIEW v_user");
        DB::statement("CREATE VIEW `wings`.`v_user` AS SELECT
                        a.id_user,
                        a.id_role,
                        b.role,
                        a.username,
                        a.`password`,
                        a.created_at,
                        a.created_by,
                        a.updated_at,
                        a.updated_by
                        FROM
                        users AS a
                        INNER JOIN role_user as b ON a.id_role = b.id_role
                    ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP VIEW IF EXISTS `inv`.`v_user`");
    }
}
