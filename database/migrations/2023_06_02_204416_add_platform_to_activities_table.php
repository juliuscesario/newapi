<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPlatformToActivitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('activities', function (Blueprint $table) {
            // 1. Create new column
            // You probably want to make the new column nullable
            $table->string('browser')->unsigned()->nullable()->after('activity');
            $table->string('platform')->unsigned()->nullable()->after('activity');
            $table->string('ipAddress')->unsigned()->nullable()->after('activity');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('activities', function (Blueprint $table) {
            // 2. Drop the column
            $table->dropColumn('browser');
            $table->dropColumn('platform');
            $table->dropColumn('ipAddress');
        });
    }
}
