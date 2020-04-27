"""empty message

Revision ID: 9261467712c1
Revises: 
Create Date: 2020-04-27 00:09:44.675098

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9261467712c1'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('Actor',
    sa.Column('id', sa.Integer().with_variant(sa.Integer(), 'sqlite'), nullable=False),
    sa.Column('name', sa.String(length=120), nullable=False),
    sa.Column('age', sa.Integer(), nullable=False),
    sa.Column('gender', sa.String(length=120), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('Movie',
    sa.Column('id', sa.Integer().with_variant(sa.Integer(), 'sqlite'), nullable=False),
    sa.Column('title', sa.String(length=100), nullable=False),
    sa.Column('release_date', sa.Date(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('actor_movie',
    sa.Column('Actor', sa.Integer(), nullable=False),
    sa.Column('Movie', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['Actor'], ['Actor.id'], ),
    sa.ForeignKeyConstraint(['Movie'], ['Movie.id'], ),
    sa.PrimaryKeyConstraint('Actor', 'Movie')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('actor_movie')
    op.drop_table('Movie')
    op.drop_table('Actor')
    # ### end Alembic commands ###