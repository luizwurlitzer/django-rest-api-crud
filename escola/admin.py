from django.contrib import admin
from escola.models import Aluno, Curso, Matricula

class Alunos(admin.ModelAdmin):
        list_display = ('id', 'nome', 'rg', 'cpf', 'dtNascimento')
        list_display_links = ('id','nome')
        search_fields = ('nome',)
        list_per_page = 20

admin.site.register(Aluno, Alunos)

class Cursos(admin.ModelAdmin):
        list_display = ('id', 'codigoCurso', 'descricao')
        list_display_links = ('id', 'codigoCurso')
        search_fields = ('codigoCurso',)
        list_per_page = 20

admin.site.register(Curso, Cursos)

class Matriculas(admin.ModelAdmin):
        list_display = ('id', 'aluno', 'curso', 'periodo')
        list_display_links = ('id',)


admin.site.register(Matricula, Matriculas)

