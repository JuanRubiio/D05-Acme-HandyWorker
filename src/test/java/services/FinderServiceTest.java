
package services;

import javax.transaction.Transactional;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class FinderServiceTest extends AbstractTest {

	@Autowired
	private FinderService	finderService;

	//@Test
	//	public void testSaveFinder() {
	//		super.authenticate("handyWorker1");
	//		final Finder finder = this.finderService.create();
	//		final Finder prueba = this.finderService.save(finder);
	//		final Finder finderr = this.finderService.findOne(prueba.getId());
	//		Assert.notNull(finderr);
	//		super.authenticate(null);
	//	}

}
