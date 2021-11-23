
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



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

title = #"Zebulon Dance"
composer = #"Didier Lockwood"
meter = #"(Folk)"
kwtempo = #"Fast"
kwstyle = #"Folk"

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
  asplayed = #"Didier Lockwood" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=uCWn_V_mNT0"
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4. a2:7+ e:7/b a1:7+/cis d:7+ a:7+ e:7 a:7+ d:7+ d:m6 a:7+ 
  a2:7+ e4.:7/gis a8:7+ s2 b:m7/a a:7+ s a:7+ e4.:7/gis f1:7 g1:7 s8 
  a2.:7+ a1/g s a/fis s4 f1:7 g:7 a:7+ s 
  a2.:7+ a1/g s a/fis s4 f1:7 g:7 a:7+ s 
  a2:7+ e:7/b a1:7+/cis d:7+ a:7+ e:7 a:7+ d:7+ d:m6 a:7+
  a2:7+ e4.:7/gis f1:7 g1:7 a8
}


theNotes =  \relative c' {
  \clef "treble" \key a \major \time 4/4
  \partial 4. e8  a  cis \mark #1
  \repeat volta 2
  {
    d8  e4  cis  b a8 ~ | % 3
    a2 r4  a | % 4
    fis'4  gis8  a  cis, d8 r  e ~ | % 5
    e2 r4  e, | \break
    e'8  d  cis  d  b'4  gis8  e | % 7
    d4  cis  gis'8  a4 fis8 ~ | % 8
    fis4. r8  fis8  gis  a f8 ~ | % 9
    f2 r4  g | \break
    e4  cis8  a  d e8 r  cis ~
  }
  \alternative {
    {
      cis4  a8  e  b' cis4  a8 ~ | % 12
      a4  b,8  cis  a2 | % 13
      r2 r8  e'  a  cis
    }
    {
      cis4  a8  e  b' cis8 r  a, ~ | % 15
      a2 r4.  b8 ~ | % 16
      b2 r8  cis'  a4 \break \bar "||" \mark #2
    }
  }
  b2  a4  a~ | % 18
  2 r8  cis  a4 | % 19
  b2  a4  a~ | 
  2 r8  cis  a4 | % 21
  b2  a8  cis  a4 | % 22
  b2  a8  cis  a4 | % 23
  b2  a4  a~ | % 24
  2 r8  e'  cis4 |\break
  d2  cis4  a'~ | % 26
  2 r8  e  cis4 | % 27
  d2  cis4  e,~ | % 28
  2 r8  e'  cis4 | % 29
  d2  cis8  e  cis4 |
  d2  cis8  e  cis4 | % 31
  d2  cis4  cis~ | % 32
  2 r8  e,  a  cis | \break \mark #1
  d8  e4  cis b a8 ~ | % 34
  a2 r4  a | % 35
  fis'4  gis8  a  cis, d8 r  e ~ | % 36
  e2 r4  e, | \break
  e'8  d  cis  d  b'4 gis8  e | % 38
  d4  cis  gis'8  a4 fis8 ~ | % 39
  fis4. r8  fis8  gis  a f8 ~ | 
  f2 r4  g |\break
  e4  cis8  a  d  e4
  cis8 ~ | % 42
  cis4  a8  e  b' cis8 r  a, ~ | % 15
  a2 r4.  b8 ~ | % 16
  b2 r4. a'8-^ \bar "|."
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key a \major \time 4/4
  \partial 4. r4. \mark #1
  \repeat volta 2 {
    | % 2
     a2  b | % 3
    cis1 | % 4
     d2  fis | % 5
    e1 | 
     b4.  cis8 \times 2/3 { d4  e2 } | % 7
     a,2  cis4 r8  d ~ | % 8
     d2 r4 r8  f, ~ | % 9
     f2 r4  g'' | \break
     e4  cis8  a  d 
    e4  a,8 ~
  }
  \alternative {
    {
       a2  gis4.  a8 ~ | % 12
       a4  b,8  cis  a2 | % 13
      R1
    }
    {
       a'2  gis,4.  f8 ~ | % 15
       f2. r8  g ~ | % 16
       g2 r
    }
  } \break \mark #2 \bar "||"
   a2  a4  g ~ | % 18
   g4  a' -. r2 | % 19
   g,2  g4  fis ~ | 
   fis4  a' r2 | % 21
  f,1 | % 22
  g1 | % 23
   a4.  a8 ~  a4  a | % 24
   b8  cis4  d  e  fis8 | \break
   a,2  a4  g ~ | % 26
   g2. r4 | % 27
   g2  g4  fis ~ | % 28
   fis2. r4 | % 29
  f1 | 
  g1 | % 31
   a4.  a8 ~  a4  a | % 32
   b8  cis4  d  e4. | \break \bar "||" \mark #1
   a,2  b | % 34
  cis1 | % 35
   d2  fis | % 36
  e1 |
   b4.  cis8 \times 2/3 { d4  e2 } | % 38
   a,2  cis4 r8  d ~ |\break
   d2 r4 r8  f, ~ | 
   f2 r4  g'' |
   e4  cis8  a  d  e r
   a,8 | % 42
   a2  gis,4.  f8 ~ | % 43
   f2 r4 r8  g ~ | % 44
   g2 r4 r8  a -^ \bar "|."
}

grille = \chordmode {
  \bar "[|:"
 \/a2:7+ e:7/b a1:7+/cis d:7+ a:7+ \break
 e:7 a:7+ d:7+ d:m6 \break
 a:7+ \set Score.repeatCommands = #'((volta "1"))
 \/a2:7+ e:7/gis \/a:7+ b:m7/a a1:7+ 
 \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s1 \startStaff 
 \set Score.repeatCommands = #'((volta "2"))
 \/a2:7+ e:7/gis f1:7 g:7 
 \set Score.repeatCommands = #'((volta #f)) \bar "||-[|:" \break
  \v a2.:7+ a4/g a1/g \v a2./g a4/fis a1/fis \break \bar ":|]"
  \/a2:7+ e:7/b a1:7+/cis d:7+ a:7+ \break
 e:7 a:7+ d:7+ d:m6 \break
 a:7+  \/a2:7+ e:7/gis f1:7 g:7
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*3 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
        >> 
      >>
    } %\form
    }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \Basse
        >> 
      >>
} } }

