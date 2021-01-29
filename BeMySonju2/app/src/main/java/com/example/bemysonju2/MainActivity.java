package com.example.bemysonju2;

import androidx.appcompat.app.AppCompatActivity;

<<<<<<< HEAD
=======

>>>>>>> 6c146771197c4960a37e42a4d98c5bc5356337e5
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;


public class MainActivity extends AppCompatActivity {

    private ImageButton btn_main_user;
    private Button btn_main_vr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn_main_user = findViewById(R.id.btn_main_user);
        btn_main_vr = findViewById(R.id.btn_main_vr);

        btn_main_user.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, UserMain.class);
                startActivity(intent);
            }
        });

        btn_main_vr.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, VolunteerMain.class);
                startActivity(intent);
            }
        });

    }
}