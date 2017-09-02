# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Category.create(name: "Java", category_query: "(Java OR JDK OR Swing OR J2EE OR JEE OR EJB OR JavaEE OR Jboss OR Spring OR Hibernate OR Junit OR Wildfly OR websphere OR tomcat OR \"Sun Certified\" OR \"Oracle certified\" OR JME OR JSE OR SCJP OR SCJD OR SCWCD OR SCBCD OR SCDJWS OR SCMAD OR SCEA OR OCMJD OR SCWCD OR SCBCD OR SCDJWS OR SCMAD OR SCEA OR JDBC OR JSP OR JSR168 OR Servlets OR Struts2 OR Struts OR servlet OR servlets OR JMX OR JavaFX OR applets OR applet OR JVM)")
c2 = Category.create(name: "Senior Management", category_query: "(VP OR \"vice president\" OR manager OR \"senior manager\" OR \"sr manager\" OR director OR \"sr director\" OR \"senior director\" OR \"sr team lead\" OR \"senior team lead\" OR \"sr lead\" OR \"senior lead\")")
c3 = Category.create(name: "Product Marketing", category_query: "(\"product marketing\" OR \"marketing communications\" OR \"digital marketing\" OR Marcomm OR marcom OR \"go-to-market\" OR \"marketing programs\" OR \"requisite materials\" OR \"marketing campaign\" OR \"field marketing\" OR \"partner marketing\" OR \"targeted demand generation\" OR \"case studies\" OR \"solution briefs\" OR \"sales kit\")")
c4 = Category.create(name: "Python", category_query: "(Python OR CPython OR Jython OR EuroPython OR PSF OR PyCon OR PyPy OR Django OR Flask)")
c5 = Category.create(name: "Database", category_query: "(Oracle OR SQL OR \"Maria DB\" OR MySQL OR MongoDB OR Cassandra OR Hadoop OR Elasticsearch OR Redis OR Lucene OR Solr OR Memcached)")
c6 = Category.create(name: "Cloud", category_query: "(cloud OR IaaS OR PaaS OR SaaS OR Amazon OR AWS OR EC2 OR OpenStack OR OpenNebula OR OpenQRM OR OpenShift OR oVirt OR Jelastic OR PetiteCloud OR Nimbus OR CloudStack)")
c7 = Category.create(name: "Big data", category_query: "(\"data set\" OR \"structured data\" OR \"unstructure data\" OR benchmarks OR \"capacity planning\" OR threshold OR bursts OR \"divert pressure\" OR \"relational data bases\" OR \"data integration\" OR MySQL OR RDBM OR Flume OR Sqoop OR Apache OR Spark OR Hadoop OR \"big data\")")
c8 = Category.create(name: "QE", category_query: "(\"quality engineering\" OR \"quality engineer\" OR \"quality assurance\" OR \"quality analyst\" OR \"quality analysis\" OR \"quality control\" OR QC OR QA OR QE OR SQA OR SDET OR TDD OR \"engineer in test\" OR \"developer in test\" OR \"software evaluation\" OR \"automation engineer\" OR \"Test-driven development\" OR \"Test driven development\" OR verification OR \"test engineer\" OR test OR tests OR tester OR tested OR testing OR \"test execution\" OR \"test plans\" OR \"test planning\" OR \"test cases\" OR \"manual testing\"
OR automation OR \"bug fixes\" OR \"bug reports\" OR \"bug detection\" OR debugging OR debug)")

l1 = Language.create(name: "Czech")
l2 = Language.create(name: "Slovak")

u1 = User.create()
q1 = Query.create(name: "Java programmer", text_of_query: "", user_id: u1.id)
q2 = Query.create(name: "Automation Tester", text_of_query: "", user_id: u1.id)
q3 = Query.create(name: "Project Manager", text_of_query: "\"Senior Management\" AND \"Product Marketing\" AND (\"Python\" OR (\"Database\" and \"Cloud\"))", user_id: u1.id)

q3.categories << [c2, c3, c4, c5, c6]

t1 = Term.create()
t2 = Term.create()
t3 = Term.create()
t4 = Term.create()

t1.category = c1
t1.query = q1
t1.operator = "AND"

t2.category = c5
t2.query = q1
t2.operator = "AND"

t3.category = c7
t3.query = q1
t3.operator = "OR"

t4.category = c8
t4.query = q2
t4.operator = "AND"

ql1 = QueryLanguage.create()
ql1.language = l1
ql1.query = q2

ql2 = QueryLanguage.create()
ql2.language = l2
ql2.query = q2

tr1 = Translation.create()
tr1.language = l1
tr1.category = c3
tr1.translated_query = "(\"segmentace trhu\" OR \"zakaznicka segmentace\")"

tr2 = Translation.create()
tr2.language = l2
tr2.category = c3
tr2.translated_query = "(\"segmentacia trhu\" OR \"zakaznicka segmentacia\")"

tr3 = Translation.create()
tr3.language = l1
tr3.category = c8
tr3.translated_query = "(testovani OR automatizace OR kvalita OR \"kontrola kvality\" OR verifikace OR testy)"

tr4 = Translation.create()
tr4.language = l2
tr4.category = c8
tr4.translated_query = "(testovanie OR automatizacia OR kvalita OR \"kontrola kvality\" OR verifikacia OR testy)"
