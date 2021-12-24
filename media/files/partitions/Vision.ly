
\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "twoCompoundMeters.ly"


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Vision"
composer = #"Zem Audu"
meter = #"(Med. World)"
kwtempo = #"Medium"
kwstyle = #"World"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Zem Audu" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=Idt9KDH3FCc"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  % \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %\override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  % }
}
\layout {
  \context {
    \Score
    \override NonMusicalPaperColumn #'line-break-permission = ##f
    \override NonMusicalPaperColumn #'page-break-permission = ##f
  }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  r8*11 s8*11*25 c8*11:m s8*11*23
  d8*11:m5-7 f:m g:m7 a:m5-7 bes g:m/d c2:m g8*7:m7 c8*11:m c:m
  s8*11*4 
  \once \override ChordName.X-offset = #-18
  c8*11*8:m s8*11*11 
  d8*11:m5-7 f:m g:m7 a:m5-7 bes g:m/d c2:m g8*7:m7 c8*11:m c:m c:m

}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major 
  \twoCompoundMeters #'((4 8) (4 8) (3 8)) #'(11 8)
  \showStartRepeatBar \bar "[|:" 
  \repeat volta 2 { R8*44 } \break 
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \smaller { "Guitar continues simile until" \box \bold H }
  \markup \bold \box A
  \repeat volta 2 {
    c8 ->  c  c  c es8 ->  es  es  es g8 ->  g  bes | 
    c1 ~ ->  c4. ~ | c1 r4. | R8*11 } \break
  f,8 ->  g  f  d bes8 ->  bes  bes  c g8 ->  f  f | % 8
  f1 ~ ->  f4. ~ | f1 r4. | R8*11 | \break
  c'8 ->  c  c  c es8 ->  es  es  es g8 ->  g  bes | 
  c1 ~ ->  c4. ~ | c1 r4. | r1 r4  
  << 
    { es8 | \break
      \repeat volta 2 { 
        d1 r8  c -- r | % 16
        d1 r4  c8 | % 17
        bes1 r8  a -- r | % 18
        bes1 r4  a8 | % 19
        g1 r8  f -- r | 
        g1 r8 \times 2/3 { f4  e8 } | % 21
      }
      \alternative {
        { f2  d  es4.~ | 1 r4. }
        { f2  d2.. ~ | 1~  4. \break }
      } 
      es1~ 4.~ | 1 r4.
    } \\  
    
    { g8 | \break \mark #2
      \repeat volta 2 { 
        f1 r8  es -- r | % 16
        f1 r4  es8 | % 17
        d1 r8  c -- r | % 18
        d1 r4  c8 | \break
        bes1 r8  a -- r | 
        bes1 r8 \times 2/3 { a4  gis8 } | % 21
      }
      \alternative {
        { a2  f  g4.~ | 1 r4. }
        { a2 _\markup "Bass plays here"  f2.. ~ | 1~   f4. \bar "||"  }
      }
      \mark #3 
      
      g1~ _\markup "Drums plays here" 4.~ | 1 r4. 
    }
  >>
  R8*11 | r1 r8 \tuplet 3/2 { f8 g es }  \break
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup \smaller { "Bass continues simile until" \box H }
  f1 ~  f4. ~ | % 36
  f1 ~  f8 ~ \times 2/3  { f8  es  f } | % 37
  es2 ~  es8 ~ \times 2/3  { es8  d  es } d8~ 4. | % 38
  c1 r4. \bar "||"
  \mark #4 \break
  g'8 c es g, bes8 d c g f g8 bes | 
  c8 r bes f es bes' f8 g f es c | % 41
  f4 -- g -- f2 ~ f4. ~ | % 42
  f1 ~ f4. | \break % 43
  d8 es g bes d es8 d c g bes f8 | % 44
  bes8 g f d g f d8 c bes c es16 d16 | % 45
  c1 ~ c4. | % 46
  R8*11 |  \break % 47
  g''8 c bes f es8 g f c bes es8 c | % 48
  f8 d bes g c bes8 d c g f bes8 | % 49
  g4 g f2 ~ f4. ~ |
  f1 r8 es c |  \break % 51
  d4 f bes2 r8 g bes | % 52
  c8 d es d c bes8 g f es g bes8 | % 53
  c1 ~ c4. ~ | % 54
  c1 r4 g'8 \bar "||" 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box E \fontsize #-3 "(Tenor with Soprano one octave upper)" }
  \break
  \repeat volta 2 { 
    f1 r8 es -- r | % 56
    f1 r4 es8 | % 57
    d1 r8 c -- r | % 58
    d1 r4 c8 | \break % 59
    bes1 r8 a -- r | 
    bes1 r4 a8 | % 61
    g4 bes es4. g,4 d'}
  \alternative { 
    { c1 r4 g'8 } { c,1 r4. }
  } \bar "||"
  \pageBreak
  s8*11 \bar "" s 
  \once \override Score.RehearsalMark.extra-offset = #'(0 . -4)
  \once \override Score.RehearsalMark.stencil = #white-under
  \mark \markup { "Tenor′s Solo on" \box D and \box E } 
  \bar "" s \bar "" s \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box F \fontsize #-3 "(Tenor′s Solo Continues)" }
  R8*11*8 
  \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box G \fontsize #-3 "(Soprano′s Solo over Tenor on third and forth X)" }
  \repeat volta 4 {
    g4_\markup "drums tacet" g g2 ~ g4. ~ | % 92
    g1 ~ g8 f es | % 93
    f4 f f2 ~ f4. ~ | % 94
    f1 r8 es c \break
    d4 es bes'2 ~ bes4. ~
  }
  \alternative {
    {
      \overrideProperty Score.VoltaBracket.text \markup "1. 3."
      bes1 r8 bes c | g1~ 4.~ | 1 r4.      
    }
    { 
      \overrideProperty Score.VoltaBracket.text \markup "2. 4."
      bes1\repeatTie r8 g es | c1~ 4.~ | 1 r4 \parenthesize g''8
    }  
  }
  \bar "||-[|:" \break \mark #8
  \repeat volta 2 { 
    f1 r8 es -- r | % 56
    f1 r4 es8 | % 57
    d1 r8 c -- r | % 58
    d1 r4 c8 | \break % 59
    bes1 r8 a -- r | 
    bes1 r4 a8 | % 61
    g4 bes es4. g,4 d'}
  \alternative { 
    { c1 r4 g'8 } { c,1 r4. }
  } \bar "||-[|:" \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box Outro }
  \repeat volta 2 
  { s8*11   \bar ""
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -4)
    \once \override Score.RehearsalMark.stencil = #white-under
    \mark \markup { "Tenor fill" }     
    s8*11
  } \mark \markup 3x
  R8*11 c,1~ 4.~ 1~ 4. \bar ".."
}
chordsRhythm = \relative c {
  \clef "treble_8" 
  \twoCompoundMeters #'((4 8) (4 8) (3 8)) #'(11 8)
  \key bes \major \oneVoice
  \repeat percent 2 {
    c8 ->  f   f' -> f,8   d' ->   f,  c'8 ->   g  es ->  a  f | 
    c8 ->  f   es' ->   f, d'8 ->   f, c' -> g8  es ->  a  f }

  s8*11*78
  d8 _\markup "(Guitar plays, bass tacet)"   as'   c   f r4.   d,8 as'8   c   f | 
  f,,8   c'   f   as   c   f r4   f,,8   c'   f | % 121
  g,8   d'   f   bes   d r r4 g,,8   d'   f | % 122
  a,8   es'   a   c   es   a es8   c   a   es   a, | % 123
  bes8   f'   bes   d   f r4. bes,,8   f'   bes | % 124
  d,8   g   bes   d   f r4. g,4   bes8 | % 125
  g8   c,   es   g   c r r g8   bes   d   g | % 126
  c,,8   g'   c   es   g  es8   g   es   c   g   c, | % 127
  c8   g'   c   es   g  es8   g   es   c   g4 
  c,8 ->  f   f' -> f,8   d' ->   f,  c'8 ->   g  es ->  a  f | 
  c8 ->  f   es' ->   f, d'8 ->   f, c' -> g8  es ->  a  f
  c8 ->  f   f' -> 
  f,8   d' ->   f,  
  c'8 ->   g  es ->  a  f | % 2
  c8 ->  f   es' ->   f,
  d'8 ->   f,   c' -> 
  g8  es ->  a  f
  c4   g'   c2 ~   c4. 
}

Basse = \relative c' {
  %\override Rest #'staff-position = #0
  \twoCompoundMeters #'((4 8) (4 8) (3 8)) #'(11 8)
  \stopStaff
  s8*11*24 \startStaff
  \clef "bass" \key bes \major
  r4   g8   c   bes   g f8   bes   g   f  es8 |
  c4   c   c2   g'8   bes  g8 \bar "||"
  c,4   c   c2 ~   c4. ~ | % 32
  c1   g'8   bes   g | % 33
  c,4   c   c2 ~   c4. ~ | % 34
  c1   g'8   bes   g | % 35
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 4 pages" }
  \bookpart {
    \score {
      \new StaffGroup
      <<
        <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } 
          << 
            { \chordsRhythm } \\
            { s8*11*26 \pageBreak s8*11*65 \pageBreak }
          >>
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 4 pages" }
  \bookpart {
    \score {
      <<
        \new StaffGroup
        <<
          \new ChordNames { \transpose c d \harmonies } 
          \new Staff \with { instrumentName = \Bb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c d \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } 
          << 
            { \chordsRhythm } \\
            { s8*11*26 \pageBreak s8*11*65 \pageBreak }
          >>      
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new StaffGroup
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c a, \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } 
          << 
            { \chordsRhythm } \\
            { s8*11*26 \pageBreak s8*11*65 \pageBreak }
          >>
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      \new StaffGroup
      <<
        <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol } 
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" } 
            \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } \chordsRhythm
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new StaffGroup
        <<
          \new ChordNames { \transpose c d \harmonies } 
          \new Staff \with { instrumentName = \Bb  } <<
            % \new Voice \with { \consists "Pitch_squash_engraver" }  
            \transpose c d \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } \chordsRhythm
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new StaffGroup
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice  
            \transpose c a, \theNotes
          >> 
          \new Staff \with { \RemoveEmptyStaves instrumentName = "Guitar" } \chordsRhythm
          \new Staff 
          \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t instrumentName = "Bass" } 
          \Basse
        >>
      >>
} } }

