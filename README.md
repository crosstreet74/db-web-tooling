# db-web-tooling

[![HitCount](http://hits.dwyl.io/crosstreet74/db-web-tooling.svg)](http://hits.dwyl.io/crosstreet74/db-web-tooling)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

## What is this?

Web Application with Simple DB Editing Features

## Built With

* [Spring](https://projects.spring.io/spring-framework/) - Web framework
* [Maven](https://maven.apache.org/) - Dependency Managem ent
* [Apache Tiles](https://tiles.apache.org/) - View framework
* [ax5ui-grid](https://http://ax5.io/ax5ui-grid/) -  UI drawing table grids

## Deployment

* [Apache Tomcat 7](https://tomcat.apache.org/download-70.cgi)

## Required Steps to Checkout

### Prerequisites

* [Java SE Development Kit 8u152](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html)
* **Database** is necessary of course

### Eclipse Preferences
1. Select import option ***Check out Maven projects from SCM***
2. If required, install ***m2e-egit*** SCM Connector
3. Select option ***git*** and set URL as ***https://github.com/crosstreet74/db-web-tooling***
4. Click Finish 

### Before Deployment

> Some Maven Dependency on ***pom.xml*** should be replaced with proper JDBC Driver for your Databse.
>
    <dependency>
        <groupId>org.mariadb.jdbc</groupId>
        <artifactId>mariadb-java-client</artifactId>
        <version>1.6.5</version>
    </dependency>

> And either make some changes on ***context-datasource.xml*** fit to your database information.
>
    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
        <property name="driverClassName" value="org.mariadb.jdbc.Driver"/>
        <property name="url" value="jdbc:mariadb://localhost:8210"/>
        <property name="username" value="user"/>
        <property name="password" value="password"/>
    </bean>
> Now ***Run on Server*** the project!

## License
Soon will be ready

## Contributors

* [@crosstreet74](https://github.com/crosstreet74)
* [@hahlee15](https://github.com/hahlee15)
