package ch.epfl.bookie.travdroid;

import android.app.Activity;
import android.os.Bundle;
import epfl.sweng.testing.TestingTransactions;
import epfl.sweng.testing.TestingTransactions.TTChecks;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    
    @Override
    protected void onResume() {
        super.onResume();
        TestingTransactions.check(TTChecks.APP_RESUMED);
    }
}
