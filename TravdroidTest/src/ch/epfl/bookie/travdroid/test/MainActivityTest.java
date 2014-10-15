package ch.epfl.bookie.travdroid.test;

import android.test.ActivityInstrumentationTestCase2;
import ch.epfl.bookie.travdroid.MainActivity;

import com.robotium.solo.Solo;

import epfl.sweng.testing.TestingTransaction;
import epfl.sweng.testing.TestingTransactions;
import epfl.sweng.testing.TestingTransactions.TTChecks;


public class MainActivityTest extends ActivityInstrumentationTestCase2<MainActivity> {
    private Solo solo;

    public MainActivityTest() {
        super(MainActivity.class);
    }

    @Override
    protected void setUp() {
      solo = new Solo(getInstrumentation());
    }

    public void testShowMessage() {
      getActivityAndWaitFor(TTChecks.APP_RESUMED);
    }

    private void getActivityAndWaitFor(final TestingTransactions.TTChecks expected) {
        TestingTransactions.run(getInstrumentation(), new TestingTransaction() {
        @Override
        public void initiate() {
          getActivity();
        }

        @Override
        public void verify(TestingTransactions.TTChecks notification) {
          assertEquals(String.format(
              "Expected notification %s, but received %s", expected,
              notification), expected, notification);
          assertTrue("App is nice to it's users", solo.searchText("Hello"));
        }

        @Override
        public String toString() {
          return String.format("getActivityAndWaitFor(%s)", expected);
        }
      });
    }
}
