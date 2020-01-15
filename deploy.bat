dotnet publish -c Release 

xcopy /y dockerfile .\bin\release\netcoreapp2.2\publish

docker build -t test_heroku-image ./bin/release/netcoreapp2.2/publish

docker tag test_heroku-image registry.heroku.com/testanchorheroku/web

docker push registry.heroku.com/testanchorheroku/web

heroku container:release web -a testanchorheroku
