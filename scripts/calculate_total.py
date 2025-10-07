from scripts.models import TotalCapital, FinancialMovements
from sqlalchemy import func, case
from datetime import date
from typing import Literal

class FinanceMovs:
    '''
    Clase definida para almacenar los métodos relacionados con la tabla de finance_movements.
    '''
    def __init__(self, session):
        self.session = session
    
    def get_total_amount(self, fm_source: str = None, fm_expense_type: str = None) -> float:
        '''
        Función realizada para obtener la suma de valores dado unos parámetros:
        - Fuente de ingreso
        - Tipo de gasto
        En caso de que no se especifiquen aquellos parámetros, se consideraran todos los valores
        como válidos de aquel no aclarado.
        '''
        # Consulta base
        query = self.session.query(
                func.coalesce(
                func.sum(
                case(
                    [(FinancialMovements.fm_type == 'out', -FinancialMovements.fm_amount)],
                    else_=FinancialMovements.fm_amount
                )), 0))
        # Filtros dinámicos
        if fm_source:
            query = query.filter(FinancialMovements.fm_source == fm_source)
        if fm_expense_type:
            query = query.filter(FinancialMovements.fm_expense_type == fm_expense_type)

        # Ejecutar consulta
        return query.scalar()

    def build_fm_dict(
            self, 
            fm_source: str, 
            fm_expense_type: str, 
            fm_type: Literal['in', 'out'],
            fm_amount: float,
            description: str = None
            ) -> dict:
        '''
        Construye un diccionario que será introducido en la tabla financial_movements.
        '''
        return {
            'fm_source': fm_source,
            'fm_expense_type': fm_expense_type,
            'fm_type': fm_type,
            'fm_amount': fm_amount,
            'description': description,
            'fm_date': date.today()
        }

    
    
        

